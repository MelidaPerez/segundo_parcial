/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.sql.ResultSet;
import java.util.HashMap;

/**
 *
 * @author Mélida Pérez
 */
public class Marca extends Persona {
    private int id_marca;
    private String marca;
    private Conexion cn;

    public Marca(){}
    public Marca(int id_marca, String marca) {
        this.id_marca = id_marca;
        this.marca = marca;
    }  
    
    public int getId_marca() {
        return id_marca;
    }

    public void setId_marca(int id_marca) {
        this.id_marca = id_marca;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    
    public HashMap drop_marca(){
        HashMap<String, String> drop = new HashMap();
        
        try{
            cn = new Conexion();
            String query = "select id_marca as id,marca from marcas;";
            cn.abrir_conexion();
            
            ResultSet consulta = cn.conexionDB.createStatement().executeQuery(query);
            while(consulta.next()){
                drop.put(consulta.getString("id"), consulta.getString("marca"));
            }
            cn.cerrar_conexion();
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        
        return drop;
    }    

    
}
