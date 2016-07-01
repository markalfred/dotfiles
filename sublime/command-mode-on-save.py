import sublime, sublime_plugin

class CommandModeOnSave(sublime_plugin.EventListener):
    def on_post_save(self, view):
        settings = view.settings()
        if settings.get('vintage_command_mode_on_save'):
            if not settings.get('command_mode'):
                view.run_command('exit_insert_mode')
