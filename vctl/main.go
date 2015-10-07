package main

import (
	"github.com/mag3llan/m3n-vulcand/registry"
	"github.com/mailgun/log"
	"github.com/mailgun/vulcand/vctl/command"
	"os"
)

var vulcanUrl string

func main() {
	log.InitWithConfig(log.Config{Name: "console"})

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
