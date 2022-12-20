package handlers

import (
	"fmt"
	"net/http"
	"path/filepath"

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
		store:  s,
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

// https://pkg.go.dev/net/http#Request.ParseMultipartForm
func (f *Images) UploadMultipart(c *gin.Context) {

	rw := c.Writer
	r := c.Request

	err := r.ParseMultipartForm(128 * 1024)
	if err != nil {
		http.Error(rw, "Expected multipart form data", http.StatusBadRequest)
		return
	}

	// from field1 to field5
	person := r.FormValue("person")

	// Delete All Files
	// 順番ここでいいかは要検討
	err = f.store.DeleteAll(person)
	if err != nil {
		fmt.Println("Error happened when deleting all files, ", err.Error())
	}

	// multipart form における value の値。
	expectedValues := []string{"field1", "field2", "field3", "field4", "field5"}

	for _, expectedValue := range expectedValues {
		file, fh, err := r.FormFile(expectedValue)
		if err != nil {
			fmt.Println("Expected file ", expectedValue)
		}

		path := filepath.Join(person, fh.Filename)
		f.store.Save(path, file)
		file.Close()
	}
}
