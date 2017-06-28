import json
import urllib

import sublime
import sublime_plugin

GIST_URL = 'https://raw.githubusercontent.com/RomuloOliveira/dot-files/master/sublime/User/Preferences.sublime-settings'  # noqa


class UpdateUserSettingsCommand(sublime_plugin.TextCommand):

    def run(self, edit):
        gist_settings = self._get_settings_from_gist(GIST_URL)
        sublime_settings = sublime.load_settings(
            'Preferences.sublime-settings'
        )
        self._update_settings(gist_settings, sublime_settings)

    @staticmethod
    def _get_settings_from_gist(url):
        try:
            response = urllib.request.urlopen(url)
            settings = json.loads(response.read().decode('utf-8'))
        except (urllib.error.URLError, ValueError) as e:
            sublime.error_message('Could not retrieve settings: {}'.format(e))
            raise

        return settings

    @staticmethod
    def _update_settings(settings_dict, sublime_settings):
        for key, value in settings_dict.items():
            sublime_settings.set(key, value)

        sublime.save_settings('Preferences.sublime-settings')
        sublime.status_message('Settings updated')
