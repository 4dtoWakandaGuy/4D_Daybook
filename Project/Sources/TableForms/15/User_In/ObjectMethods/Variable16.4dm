If (False:C215)
	//object Name: [USER]User_In.Variable16
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 07:02
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CAT_al_SupportedPicTypes;0)
	ARRAY TEXT:C222($_at_ValidPictureTypeNames; 0)
	ARRAY TEXT:C222($_at_ValidPictureTypes; 0)
	//ARRAY TEXT(CAT_at_PictureMacTypes;0)
	//ARRAY TEXT(CAT_at_PICTURETYPEEXTENSIONS;0)
	//ARRAY TEXT(DS_S3_aFileMap;0)
	//ARRAY TEXT(DS_S4_aFileMap;0)
	C_LONGINT:C283($_l_event; $_l_FileTypePosition; $_l_FileTypePosition2; $_l_FileTypePosition3; $_l_Length)
	C_TEXT:C284($_t_FileExtension; $_t_MacintoshType; $_t_oldMethodName; $_t_PCType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Variable16"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		ARRAY TEXT:C222($_at_ValidPictureTypes; 0)
		ARRAY TEXT:C222($_at_ValidPictureTypeNames; 0)
		//_O_PICTURE TYPE LIST($_at_ValidPictureTypes;$_at_ValidPictureTypeNames)
		PICTURE CODEC LIST:C992($_at_ValidPictureTypes; $_at_ValidPictureTypeNames; *)
		
		//$_at_ValidPictureTypes contains the four char Quicktime type
		//ARRAY TEXT(DS_S3_aFileMap;0)
		//ARRAY TEXT(DS_S4_aFileMap;0)
		//DS_GETFILEMAP (->DS_S3_aFileMap;->DS_S4_aFileMap)
		Case of   //A
			: (Is Windows:C1573)  // PC
				$_t_FileExtension:=Gen_Request("Enter The 3 letter file type extension"; ""; "Save"; "Stop")
				If (OK=1)
					If ($_t_FileExtension#"")
						$_l_Length:=Length:C16($_t_FileExtension)
						If ($_l_Length=3)
							//.$_l_FileTypePosition:=Find in array(DS_S3_aFileMap;$_t_FileExtension)
						Else 
							Gen_Alert("You must enter a 3 letter extension")
							
						End if 
						
					End if 
					
				End if 
				
			Else   //A
				//MAC
				$_t_FileExtension:=Gen_Request("Enter The 4 letter file Quicktime code"; ""; "Save"; "Stop")
				If (OK=1)
					If ($_t_FileExtension#"")
						$_l_Length:=Length:C16($_t_FileExtension)
						If ($_l_Length=4)
							//$_l_FileTypePosition:=Find in array(DS_S4_aFileMap;$_t_FileExtension)
							
						Else 
							Gen_Alert("You must enter a 4 letter picture type")
							
						End if 
						
					End if 
					
				End if 
				
		End case 
End case   //A
ERR_MethodTrackerReturn("OBJ:User_In,Badd"; $_t_oldMethodName)
