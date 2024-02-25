import requests


class ColorScheme:
    """
    Should foreground and background be added separately?
    Color labels MIGHT be inaccurate in some cases.
    TODO: change colors with a shell script where theme name is provided.
    
    Initializes a color scheme with defaults:
    black = '353535'
    red = 'D25252'
    green = 'A5C261'
    yellow = 'FFC66D'
    blue = '6C99BB'
    magenta = 'D197D9'
    cyan = 'BED6FF'
    white = 'EEEEEC'
    bright_black = '535353'
    bright_red = 'F00C0C'
    bright_green = 'C2E075'
    bright_yellow = 'E1E48B'
    bright_blue = '8AB7D9'
    bright_magenta = 'EFB5F7'
    bright_cyan = 'DCF4FF'
    bright_white = 'FFFFFF'

    This particular default scheme is "Espresso" from https://gogh-co.github.io/Gogh/

    Set your theme with `set_colors_from_dict(color_dict)` or `set_colors_from_theme(theme_name)`
    Get available themes with `get_all_themes()`
    Get current scheme with `get_current_scheme()`
    """

    ALL_COLORS = ['black', 'red', 'green', 'yellow', 'blue', 'magenta', 'cyan', 'white', 'bright_black',
                  'bright_red', 'bright_green', 'bright_yellow', 'bright_blue', 'bright_magenta', 'bright_cyan', 'bright_white']
    JSON_URL = 'https://raw.githubusercontent.com/Gogh-Co/Gogh/master/data/themes.json'

    def __init__(self):
        self.black = '353535'
        self.red = 'D25252'
        self.green = 'A5C261'
        self.yellow = 'FFC66D'
        self.blue = '6C99BB'
        self.magenta = 'D197D9'
        self.cyan = 'BED6FF'
        self.white = 'EEEEEC'
        self.bright_black = '535353'
        self.bright_red = 'F00C0C'
        self.bright_green = 'C2E075'
        self.bright_yellow = 'E1E48B'
        self.bright_blue = '8AB7D9'
        self.bright_magenta = 'EFB5F7'
        self.bright_cyan = 'DCF4FF'
        self.bright_white = 'FFFFFF'

    def set_colors_from_dict(self, color_dict: dict) -> None:
        """
        Pass in a dictionary with colors you want to set for the following:
        black, red, green, yellow, blue, magenta, cyan, white, bright_black, bright_red, bright_green, bright_yellow, bright_blue, bright_magenta, bright_cyan, bright_white

        There is no proper validation for hex values yet.
        """
        for color_name, value in color_dict.items():
            color_name = '_'.join(color_name.split('-'))
            value = value[1:] if value[0] == '#' else value

            if hasattr(self, color_name):
                setattr(self, color_name, value)
            else:
                raise ValueError(
                    f"Error: Color '{color_name}' not found in ColorScheme."
                )

    def set_colors_from_theme(self, theme_name: str) -> None:
        """
        Pass in an existing theme_name from https://gogh-co.github.io/Gogh/
        Colors are extracted from https://raw.githubusercontent.com/Gogh-Co/Gogh/master/data/themes.json
        Use `get_all_themes()` to get all theme names. 
        """
        all_themes = ColorScheme.__get_json_data()
        theme = next((theme for theme in all_themes if theme["name"] == theme_name), None)
        if theme:
            index = 0
            for key, value in theme.items():
                if key[:6] == 'color_':
                    setattr(self, ColorScheme.ALL_COLORS[index], value[1:])
                    index += 1
        else:
            raise ValueError(
                f"Error: Theme '{theme_name}' not found in Gogh."
            )

    def __get_json_data() -> list:
        """
        Returns a list with all the themes from Gogh.
        """
        r = requests.get(url=ColorScheme.JSON_URL)
        return r.json()

    def get_all_themes(self) -> set:
        """
        Returns a list of all existing themes.
        """
        # Needs optimization. Maybe download the json and store locally and periodically check for new themes?
        all_themes = ColorScheme.__get_json_data()
        return {theme['name'] for theme in all_themes}

    def get_current_scheme(self) -> dict:
        """
        Returns a dictionary of currently set color_scheme.
        """
        return {color_name: getattr(self, color_name) for color_name in ColorScheme.ALL_COLORS}