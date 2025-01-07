codeunit 50141 "My Subscriber"
{
    [EventSubscriber(ObjectType::Page, Page::"Sales Order", OnBeforePostSalesOrder, '', false, false)]
    local procedure OnBeforePostSalesOrder(var SalesHeader: Record "Sales Header")
    var

    begin

    end;
}