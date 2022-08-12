If (False:C215)
	//Table Form Method Name: [USER]List_PropertiesManager
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/09/2012 22:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(AA_ab_ListProperties;0)
	//ARRAY BOOLEAN(AA_abo_Tick;0)
	//ARRAY LONGINT(AA_al_ListPropertyIDs;0)
	//ARRAY LONGINT(AA_al_TickMark;0)
	//ARRAY TEXT(AA_at_ListProperties;0)
	C_BOOLEAN:C305(AA_bo_PropertyAdded; DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_Index; AA_l_BSaveProperty; AA_l_ListPropertyID; AB_l_BUT1; AB_l_BUT10; AB_l_BUT11; AB_l_BUT12; AB_l_BUT13; AB_l_BUT14; AB_l_BUT15)
	C_LONGINT:C283(AB_l_BUT16; AB_l_BUT17; AB_l_BUT18; AB_l_BUT19; AB_l_BUT2; AB_l_BUT20; AB_l_BUT21; AB_l_BUT22; AB_l_BUT23; AB_l_BUT24; AB_l_BUT25)
	C_LONGINT:C283(AB_l_BUT26; AB_l_BUT27; AB_l_BUT3; AB_l_BUT4; AB_l_BUT5; AB_l_BUT6; AB_l_BUT7; AB_l_BUT8; AB_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; AA_t_ListProperty; oAB_COL1; oAB_COL10; oAB_COL11; oAB_COL12; oAB_COL13; oAB_COL14; oAB_COL15; oAB_COL16; oAB_COL17)
	C_TEXT:C284(oAB_COL18; oAB_COL19; oAB_COL2; oAB_COL20; oAB_COL21; oAB_COL22; oAB_COL23; oAB_COL24; oAB_COL25; oAB_COL26; oAB_COL27)
	C_TEXT:C284(oAB_COL3; oAB_COL4; oAB_COL5; oAB_COL6; oAB_COL7; oAB_COL8; oAB_COL9; oAB_HED1; oAB_HED10; oAB_HED11; oAB_HED12)
	C_TEXT:C284(oAB_HED13; oAB_HED14; oAB_HED15; oAB_HED16; oAB_HED17; oAB_HED18; oAB_HED19; oAB_HED2; oAB_HED20; oAB_HED21; oAB_HED22)
	C_TEXT:C284(oAB_HED23; oAB_HED24; oAB_HED25; oAB_HED26; oAB_HED27; oAB_HED3; oAB_HED4; oAB_HED5; oAB_HED6; oAB_HED7; oAB_HED8)
	C_TEXT:C284(oAB_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].List_PropertiesManager"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "List_PropertiesManager")
		AA_t_ListProperty:=""
		OBJECT SET VISIBLE:C603(AA_t_ListProperty; False:C215)
		OBJECT SET VISIBLE:C603(AA_l_BSaveProperty; False:C215)
		WS_AutoscreenSize(3; 300; 240)
		//position and size the window
		AA_bo_PropertyAdded:=False:C215
		ARRAY BOOLEAN:C223(AA_abo_Tick; Size of array:C274(AA_al_TickMark))
		For ($_l_Index; 1; Size of array:C274(AA_al_TickMark))
			AA_abo_Tick{$_l_Index}:=(AA_al_TickMark{$_l_Index}=1)
		End for 
		//INT_SetLongintCheckFormat (->AA_al_TickMark)
		
		
		LB_SetupListbox(->AA_ab_ListProperties; "oAB"; "AB_L"; 1; ->AA_abo_Tick; ->AA_at_ListProperties; ->AA_al_ListPropertyIDs; ->AA_al_TickMark)
		//;->AA_al_ListItemvalue)
		
		LB_SetColumnHeaders(->AA_ab_ListProperties; "AB_L"; 1; "Include"; "Property"; ""; "")
		LB_SetColumnWidths(->AA_ab_ListProperties; "oABR"; 1; 30; 200)
		LB_SetEnterable(->AA_ab_ListProperties; False:C215; 0)
		LB_SetEnterable(->AA_ab_ListProperties; True:C214; 1)
		
		If ((Size of array:C274(AA_ab_ListProperties)*16)>90)
			LB_SetScroll(->AA_ab_ListProperties; -3; -2)
		Else 
			LB_SetScroll(->AA_ab_ListProperties; -3; -3)
		End if 
		LB_StyleSettings(->AA_ab_ListProperties; "Black"; 9; "STK_t"; ->[COMPANIES:2])
		LB_Setdividers(->AA_ab_ListProperties; 0; 0)
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM:List_PropertiesManager"; $_t_oldMethodName)
