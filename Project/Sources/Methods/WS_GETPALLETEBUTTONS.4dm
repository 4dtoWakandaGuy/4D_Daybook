//%attributes = {}
If (False:C215)
	//Project Method Name:      WS_GETPALLETEBUTTONS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2010 16:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_ButtonsAssigned;0)
	//ARRAY LONGINT(DB_al_ToolPalleteIDS;0;0)
	//ARRAY PICTURE(DB_apic_ToolPalleteICONS;0;0)
	//ARRAY TEXT(DB_at_ToolPalletteFunctions;0)
	//ARRAY TEXT(DB_at_ToolPalletteTIPS;0)
	C_BOOLEAN:C305(<>DB_bo_FunctionOrder)
	C_LONGINT:C283(<>ToolpalletteSets; $_l_IconsIndex; $_l_PictureID; $_l_SetsIndex; $_l_SetsToLoad; $_l_ToolsSeriesStart)
	C_PICTURE:C286($_pic_Picture)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WS_GETPALLETEBUTTONS")
//NG September 2000
//This method Loads pallette pictures from the library
//allows for different sets of buttons

If (Is Windows:C1573)
	$_l_ToolsSeriesStart:=19300  //Rollo 7/23/2004 grey background set for windows
	OBJECT SET VISIBLE:C603(*; "oOSXShade"; False:C215)
	//_O_OBJECT SET COLOR(*;"oLine1";-241)
	OBJECT SET RGB COLORS:C628(*; "oLine1"; UTIL_4DColorToRGB(0); UTIL_4DColorToRGB(241))
	
	//_O_OBJECT SET COLOR(*;"oLine2";-241)
	OBJECT SET RGB COLORS:C628(*; "oLine2"; UTIL_4DColorToRGB(0); UTIL_4DColorToRGB(241))
	
	//_O_OBJECT SET COLOR(*;"oLine3";-241)
	OBJECT SET RGB COLORS:C628(*; "oLine3"; UTIL_4DColorToRGB(0); UTIL_4DColorToRGB(241))
	
Else 
	$_l_ToolsSeriesStart:=19500
	OBJECT SET VISIBLE:C603(*; "oWINShade"; False:C215)
End if 
<>ToolpalletteSets:=1  //the current tool palette
//if we provide a way for clients to insert their own graphic series then
//this must be dynamic

$_l_SetsToLoad:=2

ARRAY LONGINT:C221(DB_al_ToolPalleteIDS; $_l_SetsToLoad; 33)
ARRAY PICTURE:C279(DB_apic_ToolPalleteICONS; $_l_SetsToLoad; 33)
ARRAY TEXT:C222(DB_at_ToolPalletteFunctions; 33)
ARRAY TEXT:C222(DB_at_ToolPalletteTIPS; 33)
ARRAY LONGINT:C221(DB_al_ButtonsAssigned; 33)

For ($_l_SetsIndex; 1; $_l_SetsToLoad)
	For ($_l_IconsIndex; 1; 33)
		$_l_PictureID:=($_l_ToolsSeriesStart-(100*($_l_SetsIndex-1)))+$_l_IconsIndex
		$_pic_Picture:=Get_Picture($_l_PictureID)
		DB_apic_ToolPalleteICONS{$_l_SetsIndex}{$_l_IconsIndex}:=$_pic_Picture
		$_pic_Picture:=Get_Picture(99999)
		DB_al_ToolPalleteIDS{$_l_SetsIndex}{$_l_IconsIndex}:=$_l_PictureID
	End for 
End for 
DB_at_ToolPalletteTIPS{1}:="Cancel"
DB_at_ToolPalletteTIPS{2}:="Accept"
DB_at_ToolPalletteTIPS{3}:="Delete"
DB_at_ToolPalletteTIPS{4}:="Add"
DB_at_ToolPalletteTIPS{5}:="Delete Record or Related Record"
DB_at_ToolPalletteTIPS{6}:="Open"
DB_at_ToolPalletteTIPS{7}:="Previous Record"
DB_at_ToolPalletteTIPS{8}:="Next Record"
DB_at_ToolPalletteTIPS{9}:="First Record"
DB_at_ToolPalletteTIPS{10}:="Last Record"
DB_at_ToolPalletteTIPS{11}:="Select"
DB_at_ToolPalletteTIPS{12}:="Find"
DB_at_ToolPalletteTIPS{13}:="Sort"
DB_at_ToolPalletteTIPS{14}:="Data List Manager"
DB_at_ToolPalletteTIPS{15}:="Report"
DB_at_ToolPalletteTIPS{16}:="Graph"
DB_at_ToolPalletteTIPS{17}:="Global Change"
DB_at_ToolPalletteTIPS{18}:="Sum"
DB_at_ToolPalletteTIPS{19}:="Dial"
DB_at_ToolPalletteTIPS{20}:="Further Fields"
DB_at_ToolPalletteTIPS{21}:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Companies")
DB_at_ToolPalletteTIPS{22}:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Companies")  //"View Companies"
DB_at_ToolPalletteTIPS{23}:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Contacts")
DB_at_ToolPalletteTIPS{24}:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Contacts")
If (<>DB_bo_FunctionOrder)
	DB_at_ToolPalletteTIPS{25}:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Orders")  //"Enter Orders"
	DB_at_ToolPalletteTIPS{26}:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Orders")
Else 
	DB_at_ToolPalletteTIPS{25}:=Get localized string:C991("MenuItem_Enter")+" "+Get localized string:C991("MenuItem_Products")  //"Enter Products"
	DB_at_ToolPalletteTIPS{26}:=Get localized string:C991("MenuItem_View")+" "+Get localized string:C991("MenuItem_Products")
End if 
DB_at_ToolPalletteTIPS{27}:="Enter to Diary"
DB_at_ToolPalletteTIPS{28}:="Diary To Do"
DB_at_ToolPalletteTIPS{29}:="Further nformation"
DB_at_ToolPalletteTIPS{30}:="Find Information"
DB_at_ToolPalletteTIPS{31}:="Sale Pipeline"
DB_at_ToolPalletteTIPS{32}:="Enter to Pipeline"
DB_at_ToolPalletteTIPS{33}:="Enter to Targets"
DB_at_ToolPalletteFunctions{1}:="Cancel"
DB_at_ToolPalletteFunctions{2}:="OK"
DB_at_ToolPalletteFunctions{3}:="Delete"
DB_at_ToolPalletteFunctions{4}:="Plus"  // has to handle the function
DB_at_ToolPalletteFunctions{5}:="Minus"  // has to handle the function
DB_at_ToolPalletteFunctions{6}:="Open"  // has to handle the function
DB_at_ToolPalletteFunctions{7}:="Previous"
DB_at_ToolPalletteFunctions{8}:="Next"
DB_at_ToolPalletteFunctions{9}:="First"
DB_at_ToolPalletteFunctions{10}:="Last"
DB_at_ToolPalletteFunctions{11}:="Select"
DB_at_ToolPalletteFunctions{12}:="Find"
DB_at_ToolPalletteFunctions{13}:="Sort"
DB_at_ToolPalletteFunctions{14}:="Set"
DB_at_ToolPalletteFunctions{15}:="Report"
DB_at_ToolPalletteFunctions{16}:="Graph"
DB_at_ToolPalletteFunctions{17}:="Apply"
DB_at_ToolPalletteFunctions{18}:="Count"
DB_at_ToolPalletteFunctions{19}:="Tel"
DB_at_ToolPalletteFunctions{20}:="Diary"
DB_at_ToolPalletteFunctions{21}:="Companies_In"  // on double click
DB_at_ToolPalletteFunctions{22}:="Companies_Mod"  // on double click
DB_at_ToolPalletteFunctions{23}:="Contacts_In"  // on double click
DB_at_ToolPalletteFunctions{24}:="Contacts_Mod"  // on double click
DB_at_ToolPalletteFunctions{25}:="Order_In "  // on double click and function handling"
DB_at_ToolPalletteFunctions{26}:="Orders_Mod"  // on double click and function handling"
DB_at_ToolPalletteFunctions{27}:="Diary_In"  // on double click
DB_at_ToolPalletteFunctions{28}:="Diary_Mod"  // on double click and function handling"
DB_at_ToolPalletteFunctions{29}:="QVshow"  // on double click and function handling"
DB_at_ToolPalletteFunctions{30}:="QVSearch"  // on double click and function handling"
DB_at_ToolPalletteFunctions{31}:="SPshow"  // on double click and function handling"
DB_at_ToolPalletteFunctions{32}:="SPenter"  // on double click and function handling"
DB_at_ToolPalletteFunctions{33}:="STenter"  // on double click and function handling"
ERR_MethodTrackerReturn("WS_GETPALLETEBUTTONS"; $_t_oldMethodName)
