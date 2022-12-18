package main

import (
	"fmt"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/kokoichi206/action-image-manager/server/files"
	"github.com/kokoichi206/action-image-manager/server/handlers"
)

var bindAddress = ":9090"
var imageBasePath = "./imagestore"

func main() {

	stor, err := files.NewLocal(imageBasePath, 1024*1000*1000*5)
	if err != nil {
		fmt.Println("Unable to create storage", "error: ", err)
		os.Exit(1)
	}

	r := gin.Default()
	uh := handlers.NewUsers(stor)
	r.GET("/users", uh.AllUsers)

	ih := handlers.NewImages(stor)
	r.GET("/images", ih.AllImages)

	r.Run(bindAddress)
}
