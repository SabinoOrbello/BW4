using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BW4
{
    public partial class _Default : Page
    {
        private const int ProdottiPerPagina = 5;
        private int PaginaCorrente = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Controlla se la pagina è stata richiamata per la prima volta o a causa di un postback
            if (!IsPostBack)
            {
                // Inizializza la variabile PaginaCorrente a 1 quando la pagina è caricata per la prima volta
                PaginaCorrente = 1;
            }

            // Carica i dati in base alla paginazione
            CaricaDatiPagina();
        }

        protected void CaricaDatiPagina()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MyDb"].ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            try
            {
                conn.Open();

                // Modifica la query SQL in base alla paginazione
                string query = $"SELECT * FROM Prodotto ORDER BY IDProdotto OFFSET {(PaginaCorrente - 1) * ProdottiPerPagina} ROWS FETCH NEXT {ProdottiPerPagina} ROWS ONLY";

                SqlCommand cmd = new SqlCommand(query, conn);

                SqlDataReader reader = cmd.ExecuteReader();

                List<Prodotto> listaProdotti = new List<Prodotto>();

                while (reader.Read())
                {
                    // ... il codice esistente per caricare i prodotti nella lista
                    Prodotto prodotto = new Prodotto();
                    prodotto.Id = Convert.ToInt32(reader["IDProdotto"]);
                    prodotto.NomeProdotto = reader.GetString(1);
                    prodotto.Descrizione = reader.GetString(2);
                    prodotto.Prezzo = reader.GetDecimal(3);
                    prodotto.Immagine = reader.GetString(4);

                    listaProdotti.Add(prodotto);
                }

                Repeater1.DataSource = listaProdotti;
                Repeater1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write($"Errore durante il recupero dei dati: {ex.Message}");
            }
            finally
            {
                conn.Close();
            }
        }

        protected void btnPrecedente_Click(object sender, EventArgs e)
        {
            // Riduci la variabile PaginaCorrente se non è già la prima pagina
            if (PaginaCorrente > 1)
            {
                PaginaCorrente--;
                CaricaDatiPagina();
            }
        }

        protected void btnSuccessivo_Click(object sender, EventArgs e)
        {
            // Incrementa la variabile PaginaCorrente se non è già l'ultima pagina

            PaginaCorrente++;
            CaricaDatiPagina();
        }


        protected void addToCart_Click(object sender, EventArgs e)
        {
            string idString = ((Button)sender).CommandArgument;
            int id = int.Parse(idString);

            string connectionString = ConfigurationManager.ConnectionStrings["MyDb"].ToString();
            SqlConnection conn = new SqlConnection(connectionString);

            try
            {
                conn.Open();

                string query = "SELECT * FROM Prodotto WHERE IDProdotto = " + id;

                SqlCommand cmd = new SqlCommand(query, conn);

                SqlDataReader reader = cmd.ExecuteReader();

                if (Session["cart"] == null)
                {
                    Session["cart"] = new List<Prodotto>();
                }

                if (reader.Read())
                {
                    List<Prodotto> cart = (List<Prodotto>)Session["cart"];
                    Prodotto prodotto = new Prodotto();
                    prodotto.Id = Convert.ToInt32(reader["IDProdotto"]);
                    prodotto.NomeProdotto = reader.GetString(1);
                    prodotto.Descrizione = reader.GetString(2);
                    prodotto.Prezzo = reader.GetDecimal(3);
                    prodotto.Immagine = reader.GetString(4);

                    cart.Add(prodotto);
                    Session["cart"] = cart;
                    Response.Redirect(Request.RawUrl);
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally { conn.Close(); }
        }
    }
}