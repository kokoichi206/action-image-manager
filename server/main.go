package main

import (
	"github.com/gin-gonic/gin"
)

var bindAddress = ":9090"
var imageBasePath = "./imagestore"

func main() {

	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})

	r.Run(bindAddress)
}
