If (False:C215)
	//Table Form Method Name: [USER]SVS_AncillaryProducts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/03/2010 19:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SC_lb_Ancillaries;0)
	//ARRAY BOOLEAN(SVS_abo_AccessoryIncluded;0)
	//ARRAY LONGINT(SC_al_ComponentID;0)
	//ARRAY LONGINT(SC_al_LocationID;0)
	//ARRAY LONGINT(SC_al_ProductItemID;0)
	//ARRAY LONGINT(SVS_al_Accessory;0)
	//ARRAY LONGINT(SVS_al_IncProdID;0)
	//ARRAY LONGINT(SVS_al_LocationID;0)
	//ARRAY TEXT(SC_at_LocationName;0)
	//ARRAY TEXT(SVS_at_Accessory;0)
	//ARRAY TEXT(SVS_at_AnLocationnames;0)
	//ARRAY TEXT(SVS_at_CallLocations;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_AccessoryRow; $_l_CountAccessories; $_l_event; $_l_Index; SC_l_BUT1; SC_l_BUT2; SC_l_BUT3; SC_l_BUT4; SC_l_BUT5; SC_l_BUT6; SC_l_BUT7)
	C_LONGINT:C283(SC_l_BUT8)
	C_TEXT:C284($_t_oldMethodName; SVS_COL1; SVS_COL2; SVS_COL3; SVS_COL4; SVS_COL5; SVS_COL6; SVS_COL7; SVS_COL8; SVS_HED1; SVS_HED2)
	C_TEXT:C284(SVS_HED3; SVS_HED4; SVS_HED5; SVS_HED6; SVS_HED7; SVS_HED8)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].SVS_AncillaryProducts"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		$_l_CountAccessories:=Size of array:C274(SVS_at_Accessory)
		ARRAY BOOLEAN:C223(SVS_abo_AccessoryIncluded; 0)
		ARRAY TEXT:C222(SVS_at_AnLocationnames; 0)
		ARRAY LONGINT:C221(SVS_al_LocationID; 0)
		ARRAY LONGINT:C221(SVS_al_IncProdID; 0)
		ARRAY BOOLEAN:C223(SVS_abo_AccessoryIncluded; $_l_CountAccessories)
		ARRAY TEXT:C222(SVS_at_AnLocationnames; $_l_CountAccessories)
		ARRAY LONGINT:C221(SVS_al_LocationID; $_l_CountAccessories)
		ARRAY LONGINT:C221(SVS_al_IncProdID; $_l_CountAccessories)
		For ($_l_Index; 1; Size of array:C274(SC_al_ProductItemID))
			If (SC_al_ComponentID{$_l_Index}>0)
				$_l_AccessoryRow:=Find in array:C230(SVS_al_Accessory; SC_al_ComponentID{$_l_Index})
				SVS_abo_AccessoryIncluded{$_l_AccessoryRow}:=True:C214
				SVS_at_AnLocationnames{$_l_AccessoryRow}:=SC_at_LocationName{$_l_Index}
				SVS_al_LocationID{$_l_AccessoryRow}:=SC_al_LocationID{$_l_Index}
				SVS_al_IncProdID{$_l_AccessoryRow}:=SC_al_ProductItemID{$_l_Index}
			End if 
		End for 
		
		LB_SetupListbox(->SC_lb_Ancillaries; "SVS"; "SC_L"; 1; ->SVS_abo_AccessoryIncluded; ->SVS_at_Accessory; ->SVS_at_AnLocationnames; ->SVS_al_LocationID; ->SVS_al_IncProdID; ->SVS_al_Accessory)
		LB_SetColumnHeaders(->SC_lb_Ancillaries; "SC_L"; 1; "is included"; "Ancillary Item"; "Location"; "LocationID"; "Line Id"; "Type"; "AccessoryID")
		
		LB_SetColumnWidths(->SC_lb_Ancillaries; "SVS"; 1; 70; 188; 188; 0; 0; 0)
		
		LB_SetEnterable(->SC_lb_Ancillaries; False:C215; 0)
		If ([SERVICE_CALLS:20]Resolved:9=False:C215)
			LB_SetEnterable(->SC_lb_Ancillaries; True:C214; 1)  //
			LB_SetChoiceList("Pop_Location"; ->SVS_at_CallLocations; ->SVS_at_AnLocationnames)
			LB_SetEnterable(->SC_lb_Ancillaries; True:C214; 3)  //Parts or status pop up
		End if 
		LB_StyleSettings(->SC_lb_Ancillaries; "Black"; 9; "SC"; ->[SERVICE_CALLS:20])
		
		
		LB_SetScroll(->SC_lb_Ancillaries; -2; -2)
		
End case 
ERR_MethodTrackerReturn("FM [USER].SVS_AncillaryProducts"; $_t_oldMethodName)
