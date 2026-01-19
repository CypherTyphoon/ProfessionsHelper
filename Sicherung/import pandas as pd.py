import pandas as pd

# Pfad zur ODS-Datei
file_path = "Item_Datenbank_TheWarWithin_mitLinks_ID_2.ods"
sheet_name = "Tabelle1"  # ggf. anpassen

# ODS auslesen, Header existiert nicht -> header=None
df = pd.read_excel(file_path, sheet_name=sheet_name, engine="odf", header=None)
df.columns = ['Category', 'Name', 'ID']  # Spalten manuell setzen

# IDs nach Category und Name sortieren
df = df.sort_values(by=['Category', 'Name', 'ID'])

# Lua-Struktur vorbereiten
lua_data = {}

for _, row in df.iterrows():
    category = row['Category']
    name = row['Name']
    item_id = int(row['ID'])

    if category not in lua_data:
        lua_data[category] = {}

    # Wenn Name schon existiert, Liste erweitern, sonst neue Liste
    if name in lua_data[category]:
        lua_data[category][name]["IDs"].append(item_id)
    else:
        lua_data[category][name] = {"IDs": [item_id]}

# Lua-Tabelle generieren
def dict_to_lua(d, indent=0):
    lua_str = "{\n"
    indent_str = "    " * (indent + 1)
    for k, v in d.items():
        lua_key = k.replace(" ", "_")  # Leerzeichen durch Unterstrich
        if isinstance(v, dict):
            lua_str += f"{indent_str}{lua_key} = {dict_to_lua(v, indent+1)},\n"
        elif isinstance(v, list):
            lua_str += f"{indent_str}{lua_key} = {{ {', '.join(map(str,v))} }},\n"
        else:
            lua_str += f'{indent_str}{lua_key} = "{v}",\n'
    lua_str += "    " * indent + "}"
    return lua_str

# Lua-Text erzeugen
lua_table = 'ProfessionsHelperData["The War Within"] = ' + dict_to_lua(lua_data)

# In Datei schreiben
output_file = "AddonData.txt"
with open(output_file, "w", encoding="utf-8") as f:
    f.write(lua_table)

print(f"Lua-Text erfolgreich in '{output_file}' gespeichert.")
