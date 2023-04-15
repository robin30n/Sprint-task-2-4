package db;

import java.util.ArrayList;

public class DBManager {
    public static ArrayList<Item> items = new ArrayList<>();
    private static int id = 5;
    static {
        items.add(new Item(1,"pen","A pen is a common writing instrument that applies ink to a surface, usually paper, for writing or drawing",
                "25.10.2021","no"));
        items.add(new Item(2,"pencil","Stationeries such as pencils, pencil stand and pencil pouches are teaching children to become more responsible as they learn to manage their stuff.",
                "25.10.2021","no"));
        items.add(new Item(3,"paper","Paper is a thin sheet material produced by mechanically or chemically processing cellulose fibres derived from wood, rags, grasses or other vegetable sources in water",
                "25.10.2021","yes"));
        items.add(new Item(4,"smartphone","A smartphone is a cellular telephone with an integrated computer and other features not originally associated with telephones such as an operating system",
                "25.10.2021","no"));
    }
    public static ArrayList<Item> getItems(){
        return items;
    }

    public static void addItem(Item item){
        item.setId(id);
        items.add(item);
        id++;
    }

    public static Item getItem(int id){
       return items.stream()
                .filter(item -> item.getId() == id)
                .findFirst()
                .orElse(null);
    }
    public static void updateItem(Item item) {
        for (Item i : items) {
            if(i.getId()==item.getId()){
                i.setId(item.getId());
                i.setName(item.getName());
                i.setDescription(item.getDescription());
                i.setDeadlineDate(item.getDeadlineDate().replace('-','.'));
                i.setFinished(item.getFinished());
            }
        }
    }

    public static void deleteItem(int id) {
        for (int i = 0; i < items.size(); i++) {
            if(items.get(i).getId()==id){
                items.remove(i);
                break;
            }
        }
    }
}
