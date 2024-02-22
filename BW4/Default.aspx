<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Default.aspx.cs" Inherits="BW4._Default" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" type="text/css" href="/Styles/css.css" />
</asp:Content>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main class="d-flex flex-wrap  gap-4 ms-5">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div class="card mx-2 my-2 text-white ombra" style="width: 200px; border: 3px solid #47738f">
                    <img src='<%# Eval("Immagine") %>' class="card-img-top img-fluid" style="height: 30vh; object-fit: contain" alt='<%# Eval("NomeProdotto") %>'>
                    <div class="card-body d-flex flex-column justify-content-between" style="background-color: #919fa8;">
                        <div>
                            <h5 class="card-title text-center"><%# Eval("NomeProdotto") %></h5>
                            <p class="card-text text-center"><%# Eval("Prezzo", "{0:c2}") %></p>
                        </div>


                    </div>
                    <div class=" card-footer" style="background-color: #919fa8;">
                        <a href='<%# "Dettagli.aspx?IdProdotto=" + Eval("Id") %>' class="btn btn-sm btnChange  text-white" style="border-color: cornsilk">Dettagli</a>
                        <asp:Button ID="addToCart" CssClass="btn btn-sm btnChange   text-white" Style="border-color: cornsilk" runat="server" Text="Add To Cart" OnClick="addToCart_Click" CommandArgument='<%# Eval("Id") %>' />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div class="d-flex justify-content-center mt-3">
            <asp:Button ID="btnPrecedente" runat="server" CssClass="btn btn-sm btnChange text-white" Text="Precedente" OnClick="btnPrecedente_Click" />
            <asp:Button ID="btnSuccessivo" runat="server" CssClass="btn btn-sm btnChange text-white ms-2" Text="Successivo" OnClick="btnSuccessivo_Click" />
        </div>
    </main>

</asp:Content>
