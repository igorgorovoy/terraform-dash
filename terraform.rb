# frozen_string_literal: true

cheatsheet do
  title "Terraform"
  docset_file_name "Terraform"
  keyword "terraform"

  introduction <<-'INTRO'
  Terraform is a tool for building, changing, and versioning infrastructure
  safely and efficiently.

  Terraform can manage existing and popular service providers as well as
  custom in-house solutions.
  INTRO

  category do
    id "apply"

    entry do
      notes <<-'NOTES'
      __Builds or changes infrastructure according to Terraform configuration
      files in `DIR`__

      By default, apply scans the current directory for the configuration
      and applies the changes appropriately. However, a path to another
      configuration or an execution plan can be provided.

      Execution plans can be used to only execute a pre-determined
      set of actions.
      NOTES
    end

    entry do
      name "-auto-approve"
      notes "Skip interactive approval of plan before applying."
    end

    entry do
      name "-backup=path"
      notes <<-'NOTES'
      Path to backup the existing state file before modifying.
      Defaults to the `-state-out` path with `.backup` extension.
      Set to `-` to disable backup.
      NOTES
    end

    entry do
      name "-compact-warnings"
      notes <<-'NOTES'
      If Terraform produces any warnings that are not
      accompanied by errors, show them in a more compact
      form that includes only the summary messages.
      NOTES
    end

    entry do
      name "-lock=true"
      notes "Lock the state file when locking is supported."
    end

    entry do
      name "-lock-timeout=0s"
      notes "Duration to retry a state lock."
    end

    entry do
      name "-input=true"
      notes "Ask for input for variables if not directly set."
    end

    entry do
      name "-no-color"
      notes 'If specified, output won\'t contain any color.'
    end

    entry do
      name "-parallelism=n"
      notes "Limit the number of parallel resource operations."
    end

    entry do
      name "-refresh=true"
      notes <<-'NOTES'
      Update state prior to checking for differences. This
      has no effect if a plan file is given to apply.
      NOTES
    end

    entry do
      name "-state=path"
      notes <<-'NOTES'
      Path to read and save state (unless state-out
      is specified). Defaults to `terraform.tfstate`
      NOTES
    end

    entry do
      name "-state-out=path"
      notes <<-'NOTES'
      Path to write state to that is different than
      `-state`. This can be used to preserve the old
      state.
      NOTES
    end

    entry do
      name "-target=resource"
      notes <<-'NOTES'
      Resource to target. Operation will be limited to this
      resource and its dependencies. This flag can be used
      multiple times
      NOTES
    end

    entry do
      name '-var \'foo=bar\''
      notes <<-'NOTES'
      Set a variable in the Terraform configuration. This
      flag can be set multiple times.
      NOTES
    end

    entry do
      name "-var-file=foo"
      notes <<-'NOTES'
      Set variables in the Terraform configuration from
      a file. If "terraform.tfvars" or any `.auto.tfvars`
      files are present, they will be automatically loaded.
      NOTES
    end
  end

  category do
    id "console"

    entry do
      notes <<-'NOTES'
        __Starts an interactive console for experimenting with Terraform
        interpolations.__

        This will open an interactive console that you can use to type
        interpolations into and inspect their values. This command loads the
        current state. This lets you explore and test interpolations before
        using them in future configurations.

        _This command will never modify your state._

        `DIR` can be set to a directory with a Terraform state to load. By
        default, this will default to the current working directory.
        NOTES
    end

    entry do
      name "-state=path"
      notes <<-'NOTES'
        Path to read state. Defaults to `terraform.tfstate`
        NOTES
    end

    entry do
      name '-var \'foo=bar\''
      notes <<-'NOTES'
        Set a variable in the Terraform configuration. This
        flag can be set multiple times.
        NOTES
    end

    entry do
      name "-var-file=foo"
      notes <<-'NOTES'
        Set variables in the Terraform configuration from
        a file. If "terraform.tfvars" or any `.auto.tfvars`
        files are present, they will be automatically loaded.
        NOTES
    end
  end

  category do
    id "destroy"

    entry do
      notes <<-'NOTES'
      __Destroy Terraform-managed infrastructure.__
      NOTES
    end

    entry do
      name "-backup=path"
      notes <<-'NOTES'
      Path to backup the existing state file before
      modifying. Defaults to the "-state-out" path with
      ".backup" extension. Set to "-" to disable backup.
      NOTES
    end

    entry do
      name "-auto-approve"
      notes <<-'NOTES'
      Skip interactive approval before destroying.
      NOTES
    end

    entry do
      name "-force"
      notes <<-'NOTES'
      Deprecated: same as auto-approve.
      NOTES
    end

    entry do
      name "-lock=true"
      notes <<-'NOTES'
      Lock the state file when locking is supported.
      NOTES
    end

    entry do
      name "-lock-timeout=0s"
      notes <<-'NOTES'
      Duration to retry a state lock.
      NOTES
    end

    entry do
      name "-no-color"
      notes <<-'NOTES'
      If specified, output won't contain any color.
      NOTES
    end

    entry do
      name "-parallelism=n"
      notes <<-'NOTES'
      Limit the number of concurrent operations.
      Defaults to 10.
      NOTES
    end

    entry do
      name "-refresh=true"
      notes <<-'NOTES'
      Update state prior to checking for differences. This
      has no effect if a plan file is given to apply.
      NOTES
    end

    entry do
      name "-state=path"
      notes <<-'NOTES'
      Path to read and save state (unless state-out
      is specified). Defaults to "terraform.tfstate".
      NOTES
    end

    entry do
      name "-state-out=path"
      notes <<-'NOTES'
      Path to write state to that is different than
      state.
      NOTES
    end

    entry do
      name "-target=resource"
      notes <<-'NOTES'
      Resource to target. Operation will be limited to this
      resource and its dependencies. This flag can be used
      multiple times.
      NOTES
    end

    entry do
      name '-var \'foo=bar\''
      notes <<-'NOTES'
      Set a variable in the Terraform configuration. This
      flag can be set multiple times.
      NOTES
    end

    entry do
      name "-var-file=foo"
      notes <<-'NOTES'
      Set variables in the Terraform configuration from
      a file. If "terraform.tfvars" or any ".auto.tfvars"
      files are present, they will be automatically loaded.
      NOTES
    end
  end

  category do
    id 'fmt'

    entry do
      notes <<-'NOTES'
      __Rewrites all Terraform configuration files to a canonical format.__
      
      Both configuration files (.tf) and variables files (.tfvars) are updated.
      JSON files (.tf.json or .tfvars.json) are not modified.

      If DIR is not specified then the current working directory will be used.
      If DIR is "-" then content will be read from STDIN. The given content must
      be in the Terraform language native syntax; JSON is not supported.
      NOTES
    end

    entry do
      name '-list=false'
      notes <<-'NOTES'
      Don't list files whose formatting differs
      (always disabled if using STDIN)
      NOTES
    end

    entry do
      name '-write=false'
      notes <<-'NOTES'
      Don't write to source files
      (always disabled if using STDIN or -check)
      NOTES
    end

    entry do
      name '-diff'
      notes <<-'NOTES'
      Display diffs of formatting changes
      NOTES
    end

    entry do
      name '-check'
      notes <<-'NOTES'
      Check if the input is formatted. Exit status will be 0 if all
      input is properly formatted and non-zero otherwise.
      NOTES
    end

    entry do
      name '-no-color'
      notes <<-'NOTES'
      If specified, output won't contain any color.
      NOTES
    end

    entry do
      name '-recursive'
      notes <<-'NOTES'
      Also process files in subdirectories. By default, only the
      given directory (or current directory) is processed.
      NOTES
    end
  end

  category do
    id 'get'

    entry do
      notes <<-'NOTES'
      __Downloads and installs modules needed for the configuration given by PATH.__

      This recursively downloads all modules needed, such as modules
      imported by modules imported by the root and so on. If a module is
      already downloaded, it will not be redownloaded or checked for updates
      unless the -update flag is specified.
      NOTES
    end

    entry do
      name '-update'
      notes <<-'NOTES'
      Check already-downloaded modules for available updates
      and install the newest versions available.
      NOTES
    end

    entry do
      name '-no-color'
      notes <<-'NOTES'
      Disable text coloring in the output.
      NOTES
    end
  end
end
