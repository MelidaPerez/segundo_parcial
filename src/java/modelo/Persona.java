/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Mélida Pérez
 */
abstract  class Persona {
    private int id;
    private String producto, descripcion, precio_costo, precio_venta, existencia;
   
    public Persona(){}
    public Persona(int id, String producto, String descripcion, String pcosto, String pventa, String existencia) {
        this.id = id;
        this.producto = producto;
        this.descripcion = descripcion;
        this.precio_costo = pcosto;
        this.precio_venta = pventa;
        this.existencia = existencia;
    }


    public int getId_producto() {
        return id;
    }

    public void setId_producto(int id_producto) {
        this.id = id_producto;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getPcosto() {
        return precio_costo;
    }

    public void setPcosto(String pcosto) {
        this.precio_costo = pcosto;
    }

    public String getPrecio_venta() {
        return precio_venta;
    }

    public void setPrecio_venta(String pventa) {
        this.precio_venta = pventa;
    }

    public String getExistencia() {
        return existencia;
    }

    public void setExistencia(String existencia) {
        this.existencia = existencia;
    }
    public int agregar(){ return 0; }
    public int modificar(){ return 0; }
    public int eliminar(){ return 0; }
    public void mostrar(){}

}

