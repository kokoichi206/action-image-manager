package files

import "io"

type Storage interface {
	GetAllDirNames() ([]string, error)
	GetAllImagePaths(userName string) ([]string, error)
	Save(path string, file io.Reader) error
	DeleteAll(userName string) error
}
