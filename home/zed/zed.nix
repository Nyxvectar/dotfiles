#  	By Raye Lattice  <nyxvectar@proton.me>  #
#   Under the MIT LICENSE, free to use.     #

{
    pkgs,
    ...
}:

{
    #xdg.configFile."zed".source = ./zed;
    # Do Not Enable Both The Two Lines Same Time
    programs.zed-editor = {
        enable = true;
        #recursive = true;
        extensions = [
            "nix"
            "swift"
            "latex"
            "xy-zed"
            "github-dark-default"
        ];
        userSettings = {
            redact_private_values = true;
            git_panel.dock = "right";
            icon_theme = "Zed (Default)";
            features.edit_prediction_provider = "zed";
            base_keymap = "VSCode";
            theme = "GitHub Dark Default";
            ui_font_size = 18;
            buffer_font_size = 20;
            file_finder.modal_max_width = "medium";
            buffer_font_family = "Ubuntu Sans Mono";
            vim_mode = true;
            vim = {};
            relative_line_numbers = true;
            tab_bar.show = true;
            scrollbar.show = "never";
            tabs.show_diagnostics = "errors";
            indent_guides = {
                enabled = true;
                coloring = "indent_aware";
            };
            centered_layout = {
                left_padding = 0.15;
                right_padding = 0.15;
            };
            agent = {
                default_model = {
                    provider = "copilot_chat";
                    model = "gpt-4o";
                };
            };
            language_models.ollama.api_url = "http://localhost:11434";
            inlay_hints.enabled = true;
            lsp."tailwindcss-language-server".settings.classAttributes = [ "class" "className" "ngClass" "styles" ];
            languages = {
                TypeScript = {
                    inlay_hints = {
                        enabled = true;
                        show_parameter_hints = false;
                        show_other_hints = true;
                        show_type_hints = true;
                    };
                };
                Python = {
                    format_on_save = "on";
                    formatter.language_server.name = "ruff";
                    language_servers = [ "pyright" "ruff" ];
                };
            };
            terminal = {
                font_family = "Ubuntu Sans Mono";
                env.EDITOR = "zed --wait";
            };
            file_types = {
                Dockerfile = [ "Dockerfile" "Dockerfile.*" ];
                JSON = [ "json" "jsonc" "*.code-snippets" ];
            };
            file_scan_exclusions = [
                "**/.git"
                "**/.svn"
                "**/.hg"
                "**/CVS"
                "**/.DS_Store"
                "**/Thumbs.db"
                "**/.classpath"
                "**/.settings"
                "**/out"
                "**/dist"
                "**/.husky"
                "**/.turbo"
                "**/.vscode-test"
                "**/.vscode"
                "**/.next"
                "**/.storybook"
                "**/.tap"
                "**/.nyc_output"
                "**/report"
                "**/node_modules"
            ];
            telemetry = {
                diagnostics = false;
                metrics = false;
            };
            project_panel = {
                button = true;
                dock = "right";
                git_status = true;
            };
            outline_panel.dock = "right";
            collaboration_panel.dock = "left";
            notification_panel.dock = "left";
        };
        # Disable the source line to use the JSON settings directly
        # xdg.configFile."zed/settings.json".source = ./zed/settings.json;
    };
    programs.vscode = {
        enable = false;
        mutableExtensionsDir = false;
#        profiles.default = {
#            enableExtensionUpdateCheck = false;
#            enableUpdateCheck = false;
#            extensions = with pkgs.vscode-extensions; [
#                github.github-vscode-theme
#            ];
#            userSettings = {
#                "debug.internalConsoleOptions" = "openOnSessionStart";
#                "debug.onTaskErrors" = "showErrors";
#                "debug.saveBeforeStart" = "nonUntitledEditorsInActiveGroup";
#                "debug.showBreakpointsInOverviewRuler" = true;
#                "debug.toolBarLocation" = "docked";
#                "editor.copyWithSyntaxHighlighting" = false;
#                "editor.cursorBlinking" = "smooth";
#                "editor.cursorSmoothCaretAnimation" = "on";
#                "editor.detectIndentation" = false;
#                "editor.fontFamily" = "Ubuntu Sans Mono";
#                "editor.fontLigatures" = true;
#                "editor.fontSize" = 16;
#                "editor.formatOnPaste" = true;
#                "editor.formatOnType" = true;
#                "editor.insertSpaces" = true;
#                "editor.linkedEditing" = true;
#                "editor.mouseWheelZoom" = true;
#                "editor.renderControlCharacters" = true;
#                "editor.renderWhitespace" = "boundary";
#                "editor.smoothScrolling" = true;
#                "editor.stickyTabStops" = true;
#                "editor.suggest.snippetsPreventQuickSuggestions" = false;
#                "editor.tabCompletion" = "on";
#                "editor.wordBasedSuggestions" = false;
#                "editor.wordWrap" = "on";
#                "explorer.confirmDelete" = false;
#                "explorer.confirmDragAndDrop" = false;
#                "files.autoGuessEncoding" = true;
#                "files.autoSave" = "onFocusChange";
#                "files.exclude" = {
#                    "**/.DS_Store" = true;
#                    "**/.git" = true;
#                    "**/.hg" = true;
#                    "**/.svn" = true;
#                    "**/CVS" = true;
#                    "**/bower_components" = true;
#                    "**/node_modules" = true;
#                    "**/tmp" = true;
#                };
#                "files.watcherExclude" = {
#                    "**/.git/objects/**" = true;
#                    "**/.git/subtree-cache/**" = true;
#                    "**/bower_components/**" = true;
#                    "**/dist/**" = true;
#                    "**/node_modules/**" = true;
#                    "**/tmp/**" = true;
#                };
#                "html.format.indentHandlebars" = true;
#                "search.followSymlinks" = false;
#                "terminal.integrated.cursorBlinking" = true;
#                "terminal.integrated.defaultProfile.windows" = "Command Prompt";
#                "terminal.integrated.rightClickBehavior" = "default";
#                "window.dialogStyle" = "custom";
#                "window.menuBarVisibility" = "visible";
#                "window.zoomLevel" = 1.5;
#                "workbench.colorTheme" = "GitHub Dark Default";
#                "workbench.editor.enablePreview" = false;
#                "workbench.editor.untitled.hint" = "hidden";
#                "workbench.editor.wrapTabs" = true;
#                "workbench.iconTheme" = "material-icon-theme";
#                "workbench.list.smoothScrolling" = true;
#                "telemetry.telemetryLevel" = "off";
#                "github.copilot.nextEditSuggestions.enabled" = true;
#            };
#        };
    };
}
