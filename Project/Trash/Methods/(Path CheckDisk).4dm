//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Path_CheckDisk
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:23
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Open)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_TEXT:C284(<>PathName; $_bo_Update; $_t_Message; $_t_oldMethodName; $_t_Path)
	C_TIME:C306(vDoc)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Path_CheckDisk")
//Path_CheckDisk - updates the Licence No from floppy disk

If (<>PathName#"")
	If (Is macOS:C1572)
		
		$_t_Path:="Daybook Update:xm"
	Else 
		$_t_Path:="A:\\xm"
	End if 
	
	$_bo_Open:=False:C215
	$_bo_Update:=""
	ON ERR CALL:C155("Remote_Err")
	//Gen_Alert ("From SPath_CheckDisk")  `26/1/2010
	vDoc:=DB_OpenDocument($_t_Path)
	If (OK=1)
		RECEIVE PACKET:C104(vDoc; $_bo_Update; Char:C90(13))
		$_bo_Open:=True:C214
	Else 
		Gen_Confirm("Please insert the Daybook Update CD, then press OK.")
		If (OK=1)
			vDoc:=DB_OpenDocument($_t_Path)
			If (OK=1)
				RECEIVE PACKET:C104(vDoc; $_bo_Update; Char:C90(13))
				$_bo_Open:=True:C214
			Else 
				Gen_Alert("No valid Daybook Update disk was found."; "Cancel")
			End if 
		End if 
	End if 
	If ($_bo_Open)
		Close_DocUMENT(vDoc)
	End if 
	
	If ($_bo_Update#"")
		QUERY:C277([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Licence:1=$_bo_Update)
		If (Records in selection:C76([LICENCE_UPDATES:97])=0)
			$_t_Message:=Path_CheckLU($_bo_Update)
			If ($_t_Message#"Err:@")
				
				//modify the contents of the disk file so that copying is pointless
				vDoc:=DB_OpenDocument($_t_Path)
				SEND PACKET:C103(vDoc; Path_CheckLUCod($_bo_Update)+Char:C90(13))
				Close_DocUMENT(vDoc)
				
				//write the Update Licence
				READ WRITE:C146([LICENCE_UPDATES:97])
				CREATE RECORD:C68([LICENCE_UPDATES:97])
				[LICENCE_UPDATES:97]Licence:1:=$_bo_Update
				[LICENCE_UPDATES:97]Update_Date:2:=<>DB_d_CurrentDate
				DB_SaveRecord(->[LICENCE_UPDATES:97])
				UNLOAD RECORD:C212([LICENCE_UPDATES:97])
				READ ONLY:C145([LICENCE_UPDATES:97])
				Gen_Alert("The following has been added to your Daybook Licence: "+$_t_Message)
			Else 
				
				$_bo_Update:=Path_CheckLUDec($_bo_Update)  //check whether the disk contents has been coded as above
				If ($_bo_Update#"")
					QUERY:C277([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]Licence:1=$_bo_Update)
				End if 
				If (($_bo_Update#"") & (Records in selection:C76([LICENCE_UPDATES:97])>0))
					Gen_Confirm("That Daybook Update disk has already been installed.  "+"Would you like to Deinstall it?"; "Deinstall"; "Cancel")
					If (OK=1)
						
						vDoc:=DB_OpenDocument($_t_Path)
						SEND PACKET:C103(vDoc; $_bo_Update+Char:C90(13))  //return the contents to the original
						Close_DocUMENT(vDoc)
						
						READ WRITE:C146([LICENCE_UPDATES:97])  //delet the Licence Update
						LOAD RECORD:C52([LICENCE_UPDATES:97])
						DELETE RECORD:C58([LICENCE_UPDATES:97])
						READ ONLY:C145([LICENCE_UPDATES:97])
						Path_Check
						
					End if 
				Else 
					Gen_Alert("That Daybook Update disk cannot be accepted: "+Substring:C12($_t_Message; 5; 32000); "Cancel")
				End if 
				
			End if 
		Else 
			Gen_Alert("That Daybook Update disk has already been installed "+"from a different disk.  Please find that disk if you wish to Deinstall."; "Cancel")
		End if 
		
	End if 
	ON ERR CALL:C155("")
Else 
	Gen_Alert("Please first enter a main Daybook Licence No"; "Cancel")
End if 
ERR_MethodTrackerReturn("Path_CheckDisk"; $_t_oldMethodName)
