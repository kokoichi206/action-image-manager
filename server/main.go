package main

import (
	"fmt"
	"net/http"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/kokoichi206/action-image-manager/server/files"
	"github.com/kokoichi206/action-image-manager/server/handlers"
	"github.com/kokoichi206/action-image-manager/server/util"
)

func main() {

	config := util.NewConfig(":9090", "./imagestore")

	stor, err := files.NewLocal(config.ImageBasePath, 1024*1000*1000*5)
	if err != nil {
		fmt.Println("Unable to create storage", "error: ", err)
		os.Exit(1)
	}

	r := gin.Default()
	uh := handlers.NewUsers(stor)
	r.GET("/users", uh.AllUsers)

	ih := handlers.NewImages(stor, config)
	r.GET("/images", ih.AllImages)

	// 静的ファイルのホスト
	r.StaticFS("/images", http.Dir(config.ImageBasePath))

	r.Run(config.BindAddress)
}
