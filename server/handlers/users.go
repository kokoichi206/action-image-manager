package handlers

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/kokoichi206/action-image-manager/server/files"
)

type Users struct {
	store files.Storage
}

func NewUsers(s files.Storage) *Users {
	return &Users{store: s}
}

// フォルダ構造からユーザー一覧を取得・返却する。
func (u *Users) AllUsers(c *gin.Context) {
	dirs, err := u.store.GetAllDirNames()
	if err != nil {
		http.Error(c.Writer, "Unable to read dirs", http.StatusInternalServerError)
		return
	}

	response := AllUsersResponse {
		Users: dirs,
	}
	c.JSON(http.StatusOK, response)
}
