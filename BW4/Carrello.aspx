<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Carrello.aspx.cs" Inherits="BW4.Carrello" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" type="text/css" href="/Styles/css.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-flex align-items-center">
        <div class="badge rounded-pill text-bg-warning p-3 fs-2 fw-semibold mb-2">
            <h2 id="intestazioneCarrello" class="me-3 d-none" runat="server">Carrello - </h2>
            <span id="totaleCarrello" runat="server">Totale Carrello:</span>
        </div>
        <div class="ms-3">
            <asp:Button ID="DeleteAll" runat="server" class="btn btn-sm btnDanger fs-5 rounded-3 p-1 fw-semibold" Text="Delete All" OnClick="DeleteAll_Click" />
        </div>
    </div>
    <main class="d-flex  flex-wrap">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div class="card mx-2 my-2 text-white" style="width: 200px; border: 3px solid #47738f;">
                    <img src='<%# Eval("Immagine") %>' class="card-img-top img-fluid" style="height: 30vh; object-fit: contain" alt='<%# Eval("NomeProdotto") %>'>
                    <div class="card-body d-flex flex-column justify-content-between" style="background-color: #919fa8;">
                        <div>
                            <h5 class="card-title  text-center"><%# Eval("NomeProdotto") %></h5>
                            <p class="card-text  text-center"><%# Eval("Prezzo", "{0:c2}") %></p>
                        </div>
                    </div>
                    <div class="card-footer text-center" style="background-color: #919fa8;">
                        <a href='<%# "Dettagli.aspx?IdProdotto=" + Eval("Id") %>' class="btn btn-sm btnChange  text-white" style="border-color: cornsilk">Dettagli</a>
                        <asp:Button ID="DeleteFromCart" CssClass="btn btn-sm btnChange text-white" runat="server" Style="border-color: cornsilk" Text="Delete" OnClick="DeleteFromCart_Click" CommandArgument='<%# Eval("Id") %>' />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </main>
</asp:Content>
