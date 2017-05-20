codeunit 72088890 "Get Weight From Denmark"
{
  // version Exercise 4


  trigger OnRun();
  begin
  end;

  [EventSubscriber(ObjectType::Codeunit, 72050012, 'GetWeightEvent', '', false, false)]
  LOCAL PROCEDURE GetWightFromDenmark(VAR Rec : Variant;VAR WeightArguments : Record 72050098;VAR Handled : Boolean);
  var
    GetWeightFromScaleFacade : Codeunit 72050012;
  begin
    IF Handled THEN // Test Near
      EXIT;

    IF GetWeightFromScaleFacade.GetCodeunitIDFromScaleSetup <> CODEUNIT::"Get Weight From Denmark" THEN // Test Far
      EXIT;

    WITH WeightArguments DO // Do It
      Weight := 6421;

    Handled := TRUE; // Clean Up
  end;

  [EventSubscriber(ObjectType::Page, 72050025, 'OnOpenPageEvent', '', true, true)]
  LOCAL PROCEDURE RegisterScale(VAR Rec : Record 72050025);
  var
    Scale : Record 72050025;
  begin
    WITH Rec DO BEGIN
      IF GET('DENMARK') THEN
        EXIT;
      INIT;
      Code := 'DENMARK';
      Description := 'Danish Scale';
      "Codeunit ID" := CODEUNIT::"Get Weight From Denmark";
      INSERT;
    END;
  end;
}
