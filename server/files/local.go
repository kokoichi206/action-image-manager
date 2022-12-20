package files

import (
	"errors"
	"fmt"
	"io"
	"io/ioutil"
	"os"
	"path/filepath"
	"strings"
)

type Local struct {
	maxFileSize int
	basePath    string
}

func NewLocal(basePath string, maxSize int) (*Local, error) {
	p, err := filepath.Abs(basePath)
	if err != nil {
		return nil, err
	}

	return &Local{basePath: p}, nil
}

func (l *Local) GetAllDirNames() ([]string, error) {
	path := l.basePath
	fmt.Println("path: ", path)
	files, err := ioutil.ReadDir(path)
	if err != nil {
		return nil, errors.New("Unable to read dir info")
	}

	dirs := []string{}
	for _, file := range files {
		if file.IsDir() {
			dirs = append(dirs, file.Name())
		}
	}

	return dirs, nil
}

func (l *Local) GetAllImagePaths(userName string) ([]string, error) {
	path := filepath.Join(l.basePath, userName)
	if !l.isValidPath(path) {
		return nil, errors.New("query parameter is not valid")
	}
	files, err := ioutil.ReadDir(path)
	if err != nil {
		return nil, errors.New("Unable to read dir")
	}

	images := []string{}
	for _, file := range files {
		images = append(images, file.Name())
	}
	return images, nil
}

func (l *Local) isValidPath(path string) bool {
	// directory traversal を簡易的に防ぐ
	return strings.Contains(path, l.basePath)
}

func (l *Local) Save(path string, contents io.Reader) error {
	fp := l.fullPath(path)

	// get the directory and make sure it exists
	d := filepath.Dir(fp)
	err := os.MkdirAll(d, os.ModePerm)
	if err != nil {
		return fmt.Errorf("Unable to create directory: %w", err)
	}

	// if the file exists delete it
	_, err = os.Stat(fp)
	if err == nil {
		err = os.Remove(fp)
		if err != nil {
			return fmt.Errorf("Unable to delete file: %w", err)
		}
	} else if !os.IsNotExist(err) {
		// if this is anything other than a not exists error
		return fmt.Errorf("Unable to get file info: %w", err)
	}

	// create a new file at the path
	f, err := os.Create(fp)
	if err != nil {
		return fmt.Errorf("Unable to create file: %w", err)
	}
	defer f.Close()

	_, err = io.Copy(f, contents)
	if err != nil {
		return fmt.Errorf("Unable to write to file: %w", err)
	}

	return nil
}

func (l *Local) fullPath(path string) string {
	return filepath.Join(l.basePath, path)
}

func (l *Local) DeleteAll(userName string) error {
	path := filepath.Join(l.basePath, userName)

	if !l.isValidPath(path) {
		return errors.New(fmt.Sprintf("path %s is not valid.", path))
	}
	files, err := ioutil.ReadDir(path)
	if err != nil {
		return errors.New("Unable to read dir")
	}

	for _, file := range files {
		err = os.Remove(filepath.Join(path, file.Name()))
		if err != nil {
			fmt.Println(err)
		}
	}

	return nil
}
