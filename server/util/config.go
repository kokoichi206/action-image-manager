package util

type Config struct {
	BindAddress string
	ImageBasePath string
}

func NewConfig(
	address, imageBasePath string,
) Config {
	return Config {
		BindAddress: ":9090",
		ImageBasePath: "./imagestore",
	}
}
