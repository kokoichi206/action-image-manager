package files

type Storage interface {
	GetAllDirNames() ([]string, error)
	GetAllImagePaths(userName string) ([]string, error)
}
