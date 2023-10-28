package cmd

import (
	"fmt"
	"runtime"

	"github.com/open-zhy/crypt0/core"
	"github.com/spf13/cobra"
)

func init() {
	rootCmd.AddCommand(versionCmd)
}

var versionCmd = &cobra.Command{
	Use:   "version",
	Short: "Print the version number of crypt0",
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Printf("crypt0 v%s\n", core.Version)
		fmt.Printf("runtime %s\n", runtime.Version())
	},
}
