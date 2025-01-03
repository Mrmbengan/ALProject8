codeunit 50104 "Sales Post Subscriber"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterPostSalesDoc, '', false, false)]
    local procedure OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header")

    var
        MyNotification: Notification;
    begin
        if SalesHeader."Last Shipping No." = '' then
            exit;

        MyNotification.Message(StrSubstNo('The shipment %1 has been posted.', SalesHeader."Last Shipping No."));
        MyNotification.Scope := NotificationScope::LocalScope;
        MyNotification.AddAction('Open Shipment', Codeunit::"Notification Codeunit", 'OpenShipmentFromNotification');
        MyNotification.SetData('ShipmentNo', SalesHeader."Last Shipping No.");
        MyNotification.Send;



    end;
}
