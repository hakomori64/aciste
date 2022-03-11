from jinja2 import Environment, FileSystemLoader
import os


def to_camel(string, titleCase=True):
    import re
    if titleCase:
        return ''.join(x.title() for x in string.split('_'))
    else:
        return re.sub("_(.)", lambda m:m.group(1).upper(), string.lower())

def saveFile(result, dest_file):
    with open(dest_file, 'w') as f:
        f.write(result)

def yes_no_input():
    while True:
        choice = input("以上で処理を進めますか [y/N]: ").lower()
        if choice in ['y', 'ye', 'yes']:
            return True
        elif choice in ['n', 'no']:
            return False


env = Environment(
    loader=FileSystemLoader('utils/templates'),
    trim_blocks=True
)

view_name = input('viewの名前をスネークケースで入力してください')
output_dir = input('出力先ディレクトリのパスを入力してください')

folder_name = view_name
view_name_without_extension = view_name
controller_name_without_extension = f'{view_name}_controller'
view_file_name = f'{view_name}.dart'
controller_file_name = f'{view_name}_controller.dart'
state_name = f'{to_camel(view_name, titleCase=True)}State'
controller_name = f'{to_camel(view_name, titleCase=True)}Controller'
controller_provider_name = f'{to_camel(view_name, titleCase=False)}ControllerProvider'
view_name = to_camel(view_name, titleCase=True)

print('folder_name', folder_name)
print('view_file_name', view_file_name)
print('controller_file_name', controller_file_name)
print('view_name', view_name)
print('state_name', state_name)
print('controller_name', controller_name)
print('controller_provider_name', controller_provider_name)
print('output_dir', output_dir)

confirmed = yes_no_input()

if not confirmed:
    print('終了します')
    exit(0)

widget_dir_name = 'widgets'
controller_dir_name = 'controllers'

'''
### folder structure

-- folder_name/
    |-- file_name
    |-- widgets/
    |-- controllers/

'''
base_dir = os.path.join(output_dir, folder_name)
widget_dir = os.path.join(base_dir, widget_dir_name)
controller_dir = os.path.join(base_dir, controller_dir_name)
view_file_path = os.path.join(base_dir, view_file_name)
controller_file_path = os.path.join(controller_dir, controller_file_name)

os.makedirs(widget_dir, exist_ok=True)
os.makedirs(controller_dir, exist_ok=True)

view_template = env.get_template('view.jinja')
controller_template = env.get_template('controller.jinja')

viewResult = view_template.render(
    view_name=view_name
)
saveFile(viewResult, view_file_path)


controllerResult = controller_template.render(
    controller_name_without_extension=controller_name_without_extension,
    state_name=state_name,
    controller_name=controller_name,
    controller_provider_name=controller_provider_name
)
saveFile(controllerResult, controller_file_path)