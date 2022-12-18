package handlers

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/kokoichi206/action-image-manager/server/files"
	"github.com/kokoichi206/action-image-manager/server/util"
)

type Images struct {
	store  files.Storage
	config util.Config
}

func NewImages(s files.Storage, c util.Config) *Images {
	return &Images{
		store: s,
		config: c,
	}
}

// ユーザー名に対して、写真一覧を取得する。
func (i *Images) AllImages(c *gin.Context) {

	userName := c.Query("un")
	if userName == "" {
		http.Error(c.Writer, "Expected query parameter un (stands for user name)", http.StatusBadRequest)
		return
	}

	paths, err := i.store.GetAllImagePaths(userName)
	if err != nil {
		http.Error(c.Writer, "Unable to read files", http.StatusInternalServerError)
		return
	}

	response := AllImagePathsResponse{
		Images: paths,
	}
	c.JSON(http.StatusOK, response)
}
