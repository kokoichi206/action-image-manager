package files

type Storage interface {
	GetAllDirNames() ([]string, error)
}
