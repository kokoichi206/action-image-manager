package util

type Config struct {
	BindAddress   string
	ImageBasePath string
}

func NewConfig(
	address, imageBasePath string,
) Config {
	return Config{
		BindAddress:   address,
		ImageBasePath: imageBasePath,
	}
}
