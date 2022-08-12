//%attributes = {}

If (False:C215)
	//Database Method Name:      AA_JUNK10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  04/10/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PlugIDS; 0)
	ARRAY TEXT:C222($_at_AttributeNames; 0)
	ARRAY TEXT:C222($_at_AttributeValues; 0)
	ARRAY TEXT:C222($_at_GroupIDS; 0)
	ARRAY TEXT:C222($_at_GroupNames; 0)
	ARRAY TEXT:C222($_at_PlugInNames; 0)
	C_BOOLEAN:C305($_bo_Isgroup; $_bo_NewconstantsStyle; $_bo_TargetFound; $_bo_TransUnitFound)
	C_DATE:C307($_d_DateCalculateFrom)
	C_LONGINT:C283($_l_AttributeRow; $_l_GetConstants; $_l_GroupIDROw; $_l_Platform; $_l_Position; $_l_Ref; $_l_SAXEvent; $_l_TimeStartDays; $_l_TimeStartHours; $_l_TimeStartMinutes; $_l_USPOst)
	C_OBJECT:C1216($_obj_Form)
	C_PICTURE:C286($_pic_Picture)
	C_POINTER:C301($_ptr_ConstantGroup; $_ptr_ConstantIDS; $_ptr_ConstantNames; $_ptr_Field)
	C_TEXT:C284($_t_ConstandID_; $_t_ConstantGroupID; $_t_ConstantID; $_t_ConstantName; $_t_ConstantsXLIFFDoc; $_t_Current; $_t_DocJSON; $_t_ElementName; $_t_ElementPrefix; $_t_FormPath; $_t_GroupName)
	C_TEXT:C284($_t_Path)
	C_TIME:C306($_ti_ConstantsXLIFF; $_ti_FormDoc; $_ti_TimeCalculateFrom; $_ti_TimeStartFrom)
End if 
//Code Starts Here
TRACE:C157
If (False:C215)
	C_OBJECT:C1216($_obj_Form)
	$_t_FormPath:="Sources"+Directory_Symbol+"TableForms"+Directory_Symbol+"2"+Directory_Symbol+"WS_TOOLBAR"+Directory_Symbol+"form.4DForm"
	$_t_Path:=Replace string:C233(Get 4D folder:C485(Current resources folder:K5:16); Directory_Symbol+"Resources"; Directory_Symbol+"Project")+$_t_FormPath
	$_ti_FormDoc:=Open document:C264($_t_Path; ""; Read mode:K24:5)
	RECEIVE PACKET:C104($_ti_FormDoc; $_t_DocJSON; 320000)
	CLOSE DOCUMENT:C267($_ti_FormDoc)
	$_obj_Form:=JSON Parse:C1218($_t_DocJSON)
End if 
TRACE:C157

$_pic_Picture:=Get_Picture(418)
Gen_Confirm("where are my buttons")

//AA_BUILDLISTFROMDATA("TitlesTest"; ->[CONTACTS]Title)


If (False:C215)
	//COM_pic_ClipBoardPICT:=Get_Picture (22566)
	TRACE:C157
	//$_ptr_Field:=Field((Table(->[ACTIONS]));3)
	
	
	PLUGIN LIST:C847($_al_PlugIDS; $_at_PlugInNames)
	For ($_l_GetConstants; 1; Size of array:C274($_at_PlugInNames))
		
		//$_l_Position:=(Position("4D Write";$_at_PlugInNames{$_l_GetConstants})>0)
		If ($_l_Position>0)
			//_O_PLATFORM PROPERTIES($_l_Platform)
			Get_PlatformProperty("Platform"; ->$_l_Platform)
			If ($_l_Platform#3)
				$_t_ConstantsXLIFFDoc:=(Application file:C491)+Folder separator:K24:12+"Contents"+Folder separator:K24:12+"Plugins"+Folder separator:K24:12+$_at_PlugInNames{$_l_GetConstants}+".bundle"+Folder separator:K24:12+"Contents"+Folder separator:K24:12+"Smart constants.xml"
			Else 
				$_t_ConstantsXLIFFDoc:=Replace string:C233((Application file:C491); "4d.exe"; "")
				$_t_ConstantsXLIFFDoc:=Replace string:C233((Application file:C491); "4d Server.exe"; "")
				If ($_t_ConstantsXLIFFDoc[[Length:C16($_t_ConstantsXLIFFDoc)]]#Folder separator:K24:12)
					$_t_ConstantsXLIFFDoc:=$_t_ConstantsXLIFFDoc+Folder separator:K24:12
				End if 
				$_t_ConstantsXLIFFDoc:=$_t_ConstantsXLIFFDoc+"Plugins"+Folder separator:K24:12+$_at_PlugInNames{$_l_GetConstants}+".bundle"+Folder separator:K24:12+"Contents"+Folder separator:K24:12+"Smart constants.xml"
				
			End if 
			///
			ARRAY TEXT:C222($_at_GroupIDS; 0)
			ARRAY TEXT:C222($_at_GroupNames; 0)
			C_BOOLEAN:C305($_bo_NewconstantsStyle)
			$_ti_ConstantsXLIFF:=Open document:C264($_t_ConstantsXLIFFDoc; Read mode:K24:5)
			$_bo_Isgroup:=False:C215
			If (OK=1)
				
				Repeat 
					$_l_SAXEvent:=SAX Get XML node:C860($_ti_ConstantsXLIFF)
					Case of 
							
						: ($_l_SAXEvent=XML start element:K45:10)
							SAX GET XML ELEMENT:C876($_ti_ConstantsXLIFF; $_t_ElementName; $_t_ElementPrefix; $_at_AttributeNames; $_at_AttributeValues)
							
							// Need to locate the "target" element for each constant "trans-unit".
							Case of 
								: ($_t_ElementName="trans-unit")
									$_l_AttributeRow:=Find in array:C230($_at_AttributeNames; "id")
									If ($_l_AttributeRow>0)
										$_t_ConstantID:=$_at_AttributeValues{$_l_AttributeRow}
										// Ignore the first trans-unit in each group, it's not a constant.
										If (Find in array:C230($_at_AttributeNames; "resname")<0)
											If ($_t_ConstantID#"@_0") | ($_bo_NewconstantsStyle)
												
												$_bo_TransUnitFound:=True:C214
												$_l_USPOst:=Position:C15("_"; $_t_ConstantID)
												$_t_ConstantID:=Substring:C12($_t_ConstantID; $_l_USPOst+1)
												$_t_ConstantGroupID:=Substring:C12($_at_AttributeValues{$_l_AttributeRow}; 1; $_l_USPOst-1)
											Else 
												$_bo_Isgroup:=True:C214
												$_bo_TransUnitFound:=True:C214
												//$_t_ConstantID:=Substring($_t_ConstantID;3)
												$_l_USPOst:=Position:C15("_"; $_t_ConstantID)
												$_t_ConstantID:=Substring:C12($_t_ConstantID; $_l_USPOst+1)
												$_t_ConstantGroupID:=Substring:C12($_at_AttributeValues{$_l_AttributeRow}; 1; $_l_USPOst-1)
											End if 
										Else 
											$_bo_IsGroup:=True:C214
											$_bo_TransUnitFound:=True:C214
											$_bo_NewconstantsStyle:=True:C214
											$_t_ConstandID_:=$_t_ConstantID
										End if 
									End if 
									
								: ($_t_ElementName="target")
									If ($_bo_TransUnitFound)
										$_bo_TargetFound:=True:C214
										$_bo_TransUnitFound:=False:C215
									End if 
								: ($_t_ElementName="trans-unit id")
									
							End case 
							
							
						: ($_l_SAXEvent=XML DATA:K45:12)
							// With the target located, we have the constant name.
							If ($_bo_TargetFound)
								SAX GET XML ELEMENT VALUE:C877($_ti_ConstantsXLIFF; $_t_ConstantName)
								If ($_bo_Isgroup)
									If ($_bo_NewconstantsStyle)
										APPEND TO ARRAY:C911($_at_GroupIDS; $_t_ConstantID)
										APPEND TO ARRAY:C911($_at_GroupNames; $_t_ConstantName)
										$_bo_Isgroup:=False:C215
									Else 
										$_t_GroupName:=$_t_ConstantName
										$_bo_Isgroup:=False:C215
									End if 
									
								Else 
									
									APPEND TO ARRAY:C911($_ptr_ConstantNames->; $_t_ConstantName)
									APPEND TO ARRAY:C911($_ptr_ConstantIDS->; Num:C11($_t_ConstantID))
									If ($_bo_NewconstantsStyle)
										$_l_GroupIDROw:=Find in array:C230($_at_GroupIDS; $_t_ConstantGroupID)
										APPEND TO ARRAY:C911($_ptr_ConstantGroup->; $_at_GroupNames{$_l_GroupIDROw})
									Else 
										APPEND TO ARRAY:C911($_ptr_ConstantGroup->; $_t_GroupName)
									End if 
									
								End if 
								$_t_ConstantName:=""
								$_t_ConstantID:=""
								$_bo_TargetFound:=False:C215
								
							End if 
							
					End case 
				Until ($_l_SAXEvent=XML end document:K45:15)
				
				CLOSE DOCUMENT:C267($_ti_ConstantsXLIFF)
			End if 
		End if 
		
		////
		//End if 
		
	End for 
End if 

TRACE:C157
$_t_Current:=Current machine:C483



