//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Almacen2._0.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Cliente
    {
        public Cliente()
        {
            this.Detalle_venta = new HashSet<Detalle_venta>();
            this.Pago = new HashSet<Pago>();
            this.Venta = new HashSet<Venta>();
        }
    
        public int numero_cliente { get; set; }
        public string descripcion { get; set; }
    
        public virtual ICollection<Detalle_venta> Detalle_venta { get; set; }
        public virtual ICollection<Pago> Pago { get; set; }
        public virtual ICollection<Venta> Venta { get; set; }
    }
}