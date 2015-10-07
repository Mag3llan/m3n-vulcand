package main

import (
    "github.com/mailgun/log"
	"github.com/mailgun/vulcand/vctl/command"
	"github.com/mag3llan/m3n-vulcand/registry"
	"os"
)

var vulcanUrl string

func main() {
	log.Init([]*log.LogConfig{&log.LogConfig{Name: "console"}})

    r, err := registry.GetRegistry()
	if err != nil {
		log.Errorf("Error: %s\n", err)
        return
	}
	cmd := command.NewCommand(r)
	if err := cmd.Run(os.Args); err != nil {
		log.Errorf("Error: %s\n", err)
	}
}
