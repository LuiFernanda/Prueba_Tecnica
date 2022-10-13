using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace testautenticacion.Models
{
    public class Usuarios
    {
        public String Nombres { get; set; }
        public String Correo { get; set; }
        public String Clave { get; set; }

        public string IdRol { get; set; }

    }
}