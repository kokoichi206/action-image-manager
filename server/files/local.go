package files

import (
	"errors"
	"fmt"
	"io/ioutil"
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
