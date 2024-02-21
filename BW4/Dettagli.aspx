<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dettagli.aspx.cs" Inherits="BW4.Dettagli" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" type="text/css" href="/Styles/css.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div class="d-flex">
            <div class="col-3">
                <div class="card mx-2 my-2 bg-dark text-white" style="width: 200px; border: 3px solid #47738f">
                    <img id="image" runat="server" src="" class="card-img-top img-fluid" alt="immagineProdotto" style="height: 30vh; object-fit: contain">
                    <div class="card-body d-flex flex-column justify-content-between" style="background-color: #919fa8;">
                        <div>
                            <h5 id="titolo" runat="server" class="card-title text-center"></h5>
                            <p id="prezzo" runat="server" class="card-text text-center mb-2"></p>
                        </div>
                    </div>
                    <div class="card-footer text-center" style="background-color: #919fa8;">
                        <asp:Button ID="addToCart" Style="border-color: cornsilk;" CssClass="btn btn-sm text-white  btnChange mb-2" runat="server" Text="Add To Cart" OnClick="addToCart_Click" CommandArgument="" />
                        <input id="quantityInput" type="number" min="0" class=" w-100 d-block" runat="server" placeholder="Scegli quantità" />
                    </div>
                </div>
            </div>
            <div class="col-9">
                <div>
                    <span class="badge rounded-pill text-bg-warning p-3 fs-2 fw-semibold mb-2">Descrizione Prodotto:</span>
                    <p id="descrizione" class="fs-4 bold ms-2 p-2 w-50 h-auto text-white rounded-3" runat="server" style="border: 2px solid #47738f; background-color: #919fa8"></p>
                </div>
            </div>

        </div>

    </main>
</asp:Content>
