import yaml
import os

_data = {}

def load_env(env):
    global _data

    file_path = os.path.join(
        os.path.dirname(__file__),
        "browser_config.yaml"
    )

    with open(file_path, "r") as file:
        config = yaml.safe_load(file)

    print("LOADED CONFIG:", config)

    if env not in config:
        raise ValueError(f"Env '{env}' not found. Available: {list(config.keys())}")

    _data = config[env]


def get_env(key):
    return _data.get(key)