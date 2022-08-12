//%attributes = {}
If (False:C215)
	//Project Method Name:      Letters_inLPA
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
	C_LONGINT:C283(Write)
	C_PICTURE:C286($_pic_4DWrite)
	C_TEXT:C284($_t_oldMethodName; <>SYS_t_4DWriteType; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters_inLPA")
//If ((◊Write="SW") | (◊Write="WS"))  ` SuperWrite or 4DWrite "Silver"
If (<>SYS_t_4DWriteType="WS")  // 4DWrite "Silver" 24/04/02 pb
	If (([DOCUMENTS:7]Document_Code:1="") | ([DOCUMENTS:7]Document_Code:1="*TMP@"))
		Letters_SWSaveA
		If (OK=1)
			ACCEPT:C269
		End if 
	Else 
		If (<>SYS_t_4DWriteType="WS")
			//
			//$_pic_4DWrite:=WR O Area to picture (Write)
			//NG April 2000 update to 4D write 655-replaced above command
			//For ease I am sending the 'assume doc saved(param 2) it would be better if
			//we knew if the doc was saved so we could choose to display dialog
			$_pic_4DWrite:=WR Area to picture:P12000:139(Write; 1; 0)
			WR SET DOC PROPERTY:P12000:109(WRITE; wr view references:K12003:17; 0)
		Else 
			//     $r:=SW Get Area(Write;$_pic_4DWrite) 24/04/02 pb
		End if 
		[DOCUMENTS:7]Write_:5:=$_pic_4DWrite
		DB_SaveRecord(->[DOCUMENTS:7])
		If (OK=1)
			ACCEPT:C269
		End if 
	End if 
Else 
	Letter_Text
End if 
ERR_MethodTrackerReturn("Letters_inLPA"; $_t_oldMethodName)
