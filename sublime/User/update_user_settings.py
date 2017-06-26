import json
import urllib2

import sublime
import sublime_plugin

GIST_URL = u'https://gist.githubusercontent.com/RomuloOliveira/f76f602eabfe8f376915a75366cbf6e1/raw/c642904331c39220caa292e1d4c12a4497944162/settings.json'  # noqa


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
            response = urllib2.urlopen(url)
            settings = json.loads(response.read())
        except (urllib2.URLError, ValueError) as e:
            sublime.error_message('Could not retrieve settings: {}'.format(e))
            raise

        return settings

    @staticmethod
    def _update_settings(settings_dict, sublime_settings):
        for key, value in settings_dict.items():
            sublime_settings.set(key, value)

        sublime.save_settings('Preferences.sublime-settings')
        sublime.status_message('Settings updated')
