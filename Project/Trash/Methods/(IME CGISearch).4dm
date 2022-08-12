//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      IME CGISearch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/04/2010 13:14
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(IME_at_ReplaceReplyCacheLabel;0)
	//ARRAY TEXT(IME_at_ReplaceReplyCacheValue;0)
	//ARRAY TEXT(IME_at_ReplyScriptPhraseLabels;0)
	C_BLOB:C604(IME_blb_Result)
	C_BOOLEAN:C305(<>IME_bo_Test; <>iStartup; IME_bo_FlushAllowed; IME_bo_Flushed; IME_bo_ReplyBLOBAllowed)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>iActivProc; <>IntStatProc; $1; IME_l_RequestID; IME_l_ScriptAccuracy; viReqID; vProc)
	C_TEXT:C284(<>TextFind; $_t_Direct; $_t_oldMethodName; $_t_Result; $_t_Text; $2; IME_t_J2BGColor; IME_t_J2BoxBorderColor; IME_t_J2DarkColor; IME_t_J2DarkTextColor; IME_t_J2Font)
	C_TEXT:C284(IME_t_J2LightColor; IME_t_J2LighterColor; IME_t_J2LightTextColor; IME_t_J2Look; IME_t_J2SigninMessage; IME_t_J2Tab; IME_t_Jabber; IME_t_Result; IME_t_Search; IWS_t_HTTPMethod; IWS_t_Search)
	C_TEXT:C284(vFirstWebRef; viSearch; vSVField3Ex; vSVField4Ex; vWebRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME CGISearch")

//IME CGISearch
//this procedure is called by NetLink when an AppleEvent
//is received from WebStar.  The NL_RequestProc command
//was used to specify this procedure.

Start_Process
READ ONLY:C145(*)

//The First_Parameter passed to this procedure from NetLink is an identifier of
//the particular connection to the web server.
viReqID:=$1
IME_l_RequestID:=$1
//The second parameter passed is the "direct parameter", which is the information
//following the $ in the URL.

//Using arrays is one way to get the parameters passed by the web server
//ARRAY TEXT(aiParams;0)  `we first define the arrays
//ARRAY TEXT(aiSelectors;0)
//ARRAY TEXT(aiFields;0)
//ARRAY TEXT(aiFieldNams;0)

//then we tell NetLink to fill the arrays with the parameter data which was passed
//NL_GetParamAry (viReqID;aiParams;aiSelectors)
//NL_GetFieldAry (viReqID;aiFields;aiFieldNams)
//NL_GetParam (viReqID;"kfor";viSearch)

$_t_Direct:=$2

//If (IME_bo_InVRS=False)
IME_bo_Flushed:=False:C215
//End if
//If (IME_bo_InVRS=False)
IME_GetClientDetails
//End if

UTI_BlobClear(->IME_blb_Result)
IME_t_Result:=""
IME_bo_FlushAllowed:=True:C214
IME_bo_ReplyBLOBAllowed:=True:C214

If ($_t_Direct="")
	$_t_Direct:="Index"
End if 

If (<>iStartup)
	Macro2("IMA Error5")
	If (<>iActivProc#0)
		$_t_Text:=String:C10(vProc)+"Error5"
	End if 
Else 
	
	Case of 
		: ($_t_Direct="PING")  //for testing purposes only
			$_t_Result:="PING OK"
			TEXT TO BLOB:C554($_t_Result; IME_blb_Result; Mac text without length:K22:10; *)
			
		: (IWS_ConnectionsRefused)  //the Refuse connections check box is checked
			$_t_Result:="<HTML><B>Error No 6</B><P>Connection Refused."+"<P>Please try again in a minute or so.</HTML>"  //Rollo 7/26/99
			TEXT TO BLOB:C554($_t_Result; IME_blb_Result; Mac text without length:K22:10; *)  //Rollo 7/26/99
			//MAC_Run (◊IME_t_MacroPrefix+"Error6")  `Rollo 7/26/99
			
		Else 
			
			viSearch:=IWS_t_Search
			
			//IME_GetClientDetails    `Rollo 7/2/99 - move to top for efficiency
			IME_t_Search:=IWS_t_Search
			//make a semi-unique ID of the Browser from the Computer, Browser type, & ClientIP
			//Rollo 7/6/99 - moved to top - IME_l_Browser:=IME_Checksum
			//Rollo 7/6/99 - (IWS_GetHeaderField("User-Agent")+IME_t_ClientIP)
			
			//IME_l_CountImage:=0  `Counts the no of IMGs sent
			// IME_l_CountInput:=0  `Counts the no of INPUTs sent
			
			//  IME_t_CursorFramesetID:=""  `Rollo 7/21/99
			// IME_t_FrameType:=""  `Rollo 4/12/2000
			
			// IME_bo_BackList:=False  `Rollo 6/9/2000
			// IME_l_PageSizeDivider:=0
			// SQL_i_PageSizeDivider:=0
			
			IME_t_Jabber:=""
			IME_t_J2BGColor:=""
			IME_t_J2LightTextColor:=""
			IME_t_J2DarkTextColor:=""
			IME_t_J2DarkColor:=""
			IME_t_J2LightColor:=""
			IME_t_J2LighterColor:=""
			IME_t_J2BoxBorderColor:=""
			IME_t_J2Font:=""
			IME_t_J2Tab:=""
			IME_t_J2SigninMessage:=""
			IME_t_J2Look:=""
			
			vWebRef:=""
			vFirstWebRef:=""
			
			ARRAY TEXT:C222(IME_at_ReplaceReplyCacheLabel; 0)
			ARRAY TEXT:C222(IME_at_ReplaceReplyCacheValue; 0)
			ARRAY TEXT:C222(IME_at_ReplyScriptPhraseLabels; 0)
			IME_l_ScriptAccuracy:=0
			
			If ($_t_Direct="*@")
				$_t_Direct:=IME_Decrypt($_t_Direct)
				viSearch:=IME_Decrypt(viSearch)  //decrypt this even if someone removes the *
				If (<>iActivProc#0)
					$_t_Text:=$_t_Direct+", "+viSearch
				End if 
				If (viSearch="&@")
					viSearch:=Replace string:C233(viSearch; "&"; "")  //remove the &s inserted for ICA Search strings
				End if 
				If (viSearch="Error1")
					$_t_Direct:="Error1"
				End if 
			End if 
			
			If ($_t_Direct="")
				IWS_SetResponseHeader(404)
				If ((IWS_t_HTTPMethod="GET") | (IWS_t_HTTPMethod="POST"))
					$_t_Direct:="Error3"
				End if 
			End if 
			
			MESSAGES OFF:C175
			vSVField4Ex:=""  //used in IME ICARecord
			vSVField3Ex:=""  //used to store the replies of Test Macros & ICAs
			//◊RecText:="NoClear"
			
			
			Case of 
					
					//other cases!!
					
				: ($_t_Direct="favicon@")
					
				Else 
					
					//$_t_Direct:=Substring($_t_Direct;1;15)
					$_t_Direct:=Substring:C12($_t_Direct; 1; 31)  //15/02/08
					If ($_t_Direct#"")
						If ($_t_Direct="IMA @")
							//Macro2 ($tIMADirect)
							Macro2($_t_Direct)  //15/02/08
						Else 
							//Macro2 ("IMA "+Substring($_t_Direct;1;11))
							Macro2("IMA "+Substring:C12($_t_Direct; 1; 31))  //15/02/08
						End if 
					End if 
					
			End case 
			
	End case 
End if 

If (<>iActivProc#0)
	<>TextFind:=String:C10(vProc)+", "+$_t_Text
	RESUME PROCESS:C320(<>iActivProc)
End if 

UNLOAD RECORD:C212([SCRIPTS:80])
If (<>IME_bo_Test)
	READ WRITE:C146([SCRIPTS:80])
	CREATE RECORD:C68([SCRIPTS:80])
	[SCRIPTS:80]Script_Code:1:="ITX Test"+String:C10(Sequence number:C244([SCRIPTS:80]))
	[SCRIPTS:80]Script_Name:2:=String:C10(<>DB_d_CurrentDate)+"   "+Time string:C180(Current time:C178)
	[SCRIPTS:80]Same_Process:6:=True:C214
	[SCRIPTS:80]Recording_Text:4:=IME_t_Result
	DB_SaveRecord(->[SCRIPTS:80])
	UNLOAD RECORD:C212([SCRIPTS:80])
End if 
READ ONLY:C145(*)

If (<>IntStatProc>0)
	POST OUTSIDE CALL:C329(<>IntStatProc)
End if 

//If (IME_bo_InVRS=False)
IME_Flush(1)
//End if
ERR_MethodTrackerReturn("IME CGISearch"; $_t_oldMethodName)