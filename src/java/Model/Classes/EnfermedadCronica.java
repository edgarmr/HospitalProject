
package Model.Classes;

public class EnfermedadCronica {
    private int enfermedad_id;
    private String nombre;
    private String anio;
    private String tratamiento;
    private String status;
    private int paciente_id;

    public int getEnfermedad_id() {
        return enfermedad_id;
    }

    public void setEnfermedad_id(int enfermedad_id) {
        this.enfermedad_id = enfermedad_id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getAnio() {
        return anio;
    }

    public void setAnio(String anio) {
        this.anio = anio;
    }

    public String getTratamiento() {
        return tratamiento;
    }

    public void setTratamiento(String tratamiento) {
        this.tratamiento = tratamiento;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getPaciente_id() {
        return paciente_id;
    }

    public void setPaciente_id(int paciente_id) {
        this.paciente_id = paciente_id;
    }
}
