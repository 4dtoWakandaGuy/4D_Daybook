//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letters SWInLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(k12003)
	//C_UNKNOWN(k12004)
	//C_UNKNOWN(vBefore2I)
	//C_UNKNOWN(vMod2)
	//C_UNKNOWN(vMod3)
	//C_UNKNOWN(vType)
	//C_UNKNOWN(Write)
	//C_UNKNOWN(xNext)
	//ARRAY TEXT(SRPricePerT;0)
	//ARRAY TEXT(SRProdCode;0)
	//ARRAY TEXT(SRQtyT;0)
	C_BOOLEAN:C305(vBefore2I; vMod2; vMod3; vBefore2)
	C_LONGINT:C283(Write; xNext; vAdd)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vType; $_t_oldMethodName; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters SWInLPB")
//Letters SWInLPB


If (vAdd=1)
	[DOCUMENTS:7]Document_Type:13:=vType
	If (xNext=1)
		[DOCUMENTS:7]Standard:9:=True:C214
	Else 
		[DOCUMENTS:7]Standard:9:=False:C215
	End if 
Else 
	vType:=[DOCUMENTS:7]Document_Type:13
	xNext:=0
End if 
//RELATE ONE([DOCUMENTS]Document Type)

//If (◊Write="SW")SuoerWrite out 24/4/2
// $r:=SW Do Command (Write;111;1)
// $r:=SW Set Area (Write;[DOCUMENTS]Write_)
//  $r:=SW Menu Info (Write;2+8;101;"";1;0;"ZLetters_SWNew")  `New proc
//  $r:=SW Menu Info (Write;2+8;102;"";1;0;"Letters_SWOpen2")  `Open proc
//  $r:=SW Menu Info (Write;2+8;103;"";1;0;"Close_Process")  `Close_Process
//  $r:=SW Menu Info (Write;2+8;106;"";1;0;"Letters_SWSave")  `Save proc
//  $r:=SW Menu Info (Write;2+8;107;"";1;0;"Letters_SWSaveA")  `Save As proc
//  $r:=SW Menu Info (Write;2+8;109;"";1;0;"Letters_SWMerge")  `Merge proc
// $r:=SW Options (Write;0;0;0;1;1;1;0)
//  MENU BAR(92)
//Else
//  If (WR Picture to offscreen area ([DOCUMENTS]Write_)=0)
//  WR Open_DocUMENT (Write;"Letter Template")
// End if
WR SET AREA PROPERTY:P12000:137(Write; 0; 0; "")
WR SET AREA PROPERTY:P12000:137(Write; wr fixed print size:K12004:5; 0; "")
WR SET AREA PROPERTY:P12000:137(write; wr allow undo:K12004:3; 1; "")
WR SET AREA PROPERTY:P12000:137(write; wr save preview:K12004:2; 1; "")
If (False:C215)
	WR O OPTIONS:P12000:30(Write; ""; 0; -1; 0; 0)
End if 

//No Change to print area
//4D Write and first page to pict
//undo enabled

//WR Area To Picture (write;1)
//WR O DISPLAY MENUBAR (Write;1)
//NG April 2000 update to 4D write 655-replaced above command
WR SET DOC PROPERTY:P12000:109(Write; wr view menubar:K12003:11; 1)

WR SET DOC PROPERTY:P12000:109(Write; 16; 0)
WR SET DOC PROPERTY:P12000:109(Write; 2; 1)
If (DB_t_CurrentFormUsage3="Blank")  //no such command
	WR O DO COMMAND:P12000:25(Write; 710)
End if 
// WR SET PREFERENCES (Write;-1;0;0)  `format; ;ruler ",cm etc

DB_SetMenuBar(""; 94)
If (Size of array:C274(SRProdCode)=0)
	//arrays defined in Letters_FileI
	FONT LIST:C460(SRProdCode)
	INSERT IN ARRAY:C227(SRProdCode; 1; 1)
	SRProdCode{1}:="Font..."
	SRProdCode:=1
	SRQtyT{1}:="Size..."
	SRQtyT{2}:="9"
	SRQtyT{3}:="10"
	SRQtyT{4}:="12"
	SRQtyT{5}:="14"
	SRQtyT{6}:="18"
	SRQtyT{7}:="24"
	SRQtyT{8}:="Larger"
	SRQtyT{9}:="Smaller"
	SRQtyT{10}:="Other..."
	SRQtyT:=1
	SRPricePerT{1}:="Colour..."
	SRPricePerT{2}:="Black"
	SRPricePerT{3}:="Red"
	SRPricePerT{4}:="Green"
	SRPricePerT{5}:="Blue"
	SRPricePerT{6}:="Cyan"
	SRPricePerT{7}:="Magenta"
	SRPricePerT{8}:="Yellow"
	SRPricePerT{9}:="Other..."
	SRPricePerT:=1
End if 
//End if

Letters_InLPB
vMod2:=False:C215  //used for show/hide invisibles
vMod3:=False:C215  //used for Zoom/unzoomed if SW or show/hide pictures if WS
vBefore2:=False:C215  //used for Show/hide rules if WS
vBefore2I:=True:C214  //used for Show/hide margins

If (([DOCUMENTS:7]Document_Code:1#"") & ([DOCUMENTS:7]Document_Code:1#"*TMP@"))
	SET WINDOW TITLE:C213([DOCUMENTS:7]Document_Code:1)
End if 

Array_LCx(0)
ERR_MethodTrackerReturn("Letters SWInLPB"; $_t_oldMethodName)
