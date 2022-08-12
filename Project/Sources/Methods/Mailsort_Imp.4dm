//%attributes = {}
If (False:C215)
	//Project Method Name:      Mailsort_Imp
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
	C_LONGINT:C283($_l_ApplicationType; $_l_CountUsers)
	C_TEXT:C284($_t_Field1; $_t_Field2; $_t_Field3; $_t_FirstValue; $_t_oldMethodName; vT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mailsort_Imp")
//Mailsort_Imp
Start_Process
$_t_Field1:=",,"
$_t_Field2:=","+Char:C90(34)
$_t_Field3:=Char:C90(34)+","
$_l_ApplicationType:=Application type:C494
If (Application type:C494=4D Remote mode:K5:5)
	
	$_l_CountUsers:=Count users:C342-1
Else 
	$_l_CountUsers:=Count users:C342
End if 
If ($_l_CountUsers=1)
	Gen_Confirm("This function is used to update the files used to calculate Mailsorts"+Char:C90(13)+Char:C90(13)+"Existing data should only be replaced by that supplied by the Post Office"; "Proceed"; "Cancel")
	If (OK=1)
		Gen_Confirm("Please show me Mailsort File A"; "OK"; "Skip it")
		If (OK=1)
			SET CHANNEL:C77(10; "")
			If (OK=1)
				RECEIVE PACKET:C104(vT; Char:C90(13))
				If (vT=(Char:C90(34)+"0"+Char:C90(34)+",@"))
					READ WRITE:C146([MAILSORT_A:77])
					ALL RECORDS:C47([MAILSORT_A:77])
					DELETE SELECTION:C66([MAILSORT_A:77])
					While (Length:C16(vT)>3)
						$_t_FirstValue:=RemoveQuote(First_Field2(vT; $_t_Field1; $_t_Field2; $_t_Field3))
						If (($_t_FirstValue="1") | ($_t_FirstValue="0"))
							CREATE RECORD:C68([MAILSORT_A:77])
							[MAILSORT_A:77]Record_Type:1:=$_t_FirstValue
							[MAILSORT_A:77]District:2:=RemoveQuote(First_Field2(vT; $_t_Field1; $_t_Field2; $_t_Field3))
							[MAILSORT_A:77]Sector:3:=RemoveQuote(First_Field2(vT; $_t_Field1; $_t_Field2; $_t_Field3))
							[MAILSORT_A:77]SSC:4:=RemoveQuote(First_Field2(vT; $_t_Field1; $_t_Field2; $_t_Field3))
							DB_SaveRecord(->[MAILSORT_A:77])
							AA_CheckFileUnlocked(->[MAILSORT_A:77]x_ID:5)
						End if 
						RECEIVE PACKET:C104(vT; Char:C90(13))
					End while 
				Else 
					Gen_Alert("That doesn't seem to be the correct file")
				End if 
			End if 
			SET CHANNEL:C77(11)
		End if 
		
		Gen_Confirm("Please show me Mailsort File B"; "OK"; "Skip it")
		If (OK=1)
			SET CHANNEL:C77(10; "")
			If (OK=1)
				RECEIVE PACKET:C104(vT; Char:C90(13))
				If (vT=(Char:C90(34)+"2"+Char:C90(34)+",@"))
					READ WRITE:C146([MAILSORT_B:78])
					ALL RECORDS:C47([MAILSORT_B:78])
					DELETE SELECTION:C66([MAILSORT_B:78])
					While (Length:C16(vT)>3)
						$_t_FirstValue:=RemoveQuote(First_Field2(vT; $_t_Field1; $_t_Field2; $_t_Field3))
						If (($_t_FirstValue="2") | ($_t_FirstValue="3"))
							CREATE RECORD:C68([MAILSORT_B:78])
							[MAILSORT_B:78]Record_Type:1:=$_t_FirstValue
							[MAILSORT_B:78]SSC:2:=RemoveQuote(First_Field2(vT; $_t_Field1; $_t_Field2; $_t_Field3))
							[MAILSORT_B:78]Label:3:=RemoveQuote(First_Field2(vT; $_t_Field1; $_t_Field2; $_t_Field3))
							[MAILSORT_B:78]Sort_Sequence:4:=RemoveQuote(First_Field2(vT; $_t_Field1; $_t_Field2; $_t_Field3))
							DB_SaveRecord(->[MAILSORT_B:78])
							AA_CheckFileUnlocked(->[MAILSORT_B:78]X_ID:6)
						End if 
						RECEIVE PACKET:C104(vT; Char:C90(13))
					End while 
				Else 
					Gen_Alert("That doesn't seem to be the correct file")
				End if 
			End if 
			SET CHANNEL:C77(11)
		End if 
		
		Gen_Confirm("Please show me Mailsort File C"; "OK"; "Skip it")
		If (OK=1)
			SET CHANNEL:C77(10; "")
			If (OK=1)
				RECEIVE PACKET:C104(vT; Char:C90(13))
				If (vT=(Char:C90(34)+"4"+Char:C90(34)+",@"))
					READ WRITE:C146([MAILSORT_C:79])
					ALL RECORDS:C47([MAILSORT_C:79])
					DELETE SELECTION:C66([MAILSORT_C:79])
					While (Length:C16(vT)>3)
						$_t_FirstValue:=RemoveQuote(First_Field2(vT; $_t_Field1; $_t_Field2; $_t_Field3))
						If ($_t_FirstValue="4")
							CREATE RECORD:C68([MAILSORT_C:79])
							[MAILSORT_C:79]Post_Town:1:=RemoveQuote(First_Field2(vT; $_t_Field1; $_t_Field2; $_t_Field3))
							[MAILSORT_C:79]Residue_Code:2:=RemoveQuote(First_Field2(vT; $_t_Field1; $_t_Field2; $_t_Field3))
							DB_SaveRecord(->[MAILSORT_C:79])
						End if 
						RECEIVE PACKET:C104(vT; Char:C90(13))
					End while 
				Else 
					Gen_Alert("That doesn't seem to be the correct file")
				End if 
			End if 
			SET CHANNEL:C77(11)
		End if 
		
		Gen_Confirm("Please show me Mailsort File D"; "OK"; "Skip it")
		If (OK=1)
			SET CHANNEL:C77(10; "")
			If (OK=1)
				RECEIVE PACKET:C104(vT; Char:C90(13))
				If (vT=(Char:C90(34)+"5"+Char:C90(34)+",@"))
					READ WRITE:C146([MAILSORT_D5:81])
					ALL RECORDS:C47([MAILSORT_D5:81])
					DELETE SELECTION:C66([MAILSORT_D5:81])
					READ WRITE:C146([MAILSORT_D6:82])
					ALL RECORDS:C47([MAILSORT_D6:82])
					DELETE SELECTION:C66([MAILSORT_D6:82])
					While (Length:C16(vT)>3)
						$_t_FirstValue:=RemoveQuote(First_Field2(vT; $_t_Field1; $_t_Field2; $_t_Field3))
						If ($_t_FirstValue="5")
							CREATE RECORD:C68([MAILSORT_D5:81])
							[MAILSORT_D5:81]Area_Code:1:=RemoveQuote(First_Field2(vT; $_t_Field1; $_t_Field2; $_t_Field3))
							[MAILSORT_D5:81]Area_Name:2:=RemoveQuote(First_Field2(vT; $_t_Field1; $_t_Field2; $_t_Field3))
							DB_SaveRecord(->[MAILSORT_D5:81])
						Else 
							If ($_t_FirstValue="6")
								CREATE RECORD:C68([MAILSORT_D6:82])
								[MAILSORT_D6:82]Area_Code:1:=RemoveQuote(First_Field2(vT; $_t_Field1; $_t_Field2; $_t_Field3))
								[MAILSORT_D6:82]Residue_Code:2:=RemoveQuote(First_Field2(vT; $_t_Field1; $_t_Field2; $_t_Field3))
								DB_SaveRecord(->[MAILSORT_D6:82])
							End if 
						End if 
						RECEIVE PACKET:C104(vT; Char:C90(13))
					End while 
				Else 
					Gen_Alert("That doesn't seem to be the correct file")
				End if 
			End if 
			SET CHANNEL:C77(11)
		End if 
		
		Gen_Confirm("The Mailsort Files Update is now complete"+Char:C90(13)+Char:C90(13)+"You should now use the 'Update Company SSCs' function"; "Update"; "No thanks")
		If (OK=1)
			ZMailsort_CoUp
		End if 
		
	End if 
Else 
	Gen_Alert("This only be used when you are the sole Daybook user"; "Cancel")
End if 
Process_End
ERR_MethodTrackerReturn("Mailsort_Imp"; $_t_oldMethodName)
