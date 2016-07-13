
package Model.Classes;

public class Producto {
    private int producto_id;
    private String nombre;
    private String descripcion;
    private float costo;
    private float precio;
    private String proveedor;
    private int existencia;
    private String tipo;
    private String unidad;
    private String status;
    private int usrAlta;
    private int usrMod;
    private String fechMod;

    public int getProducto_id() {
        return producto_id;
    }

    public void setProducto_id(int producto_id) {
        this.producto_id = producto_id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public float getCosto() {
        return costo;
    }

    public void setCosto(float costo) {
        this.costo = costo;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getUnidad() {
        return unidad;
    }

    public void setUnidad(String unidad) {
        this.unidad = unidad;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getUsrAlta() {
        return usrAlta;
    }

    public void setUsrAlta(int usrAlta) {
        this.usrAlta = usrAlta;
    }

    public int getUsrMod() {
        return usrMod;
    }

    public void setUsrMod(int usrMod) {
        this.usrMod = usrMod;
    }

    public String getFechMod() {
        return fechMod;
    }

    public void setFechMod(String fechMod) {
        this.fechMod = fechMod;
    }
}
