<%-- 
    Document   : bookConsignment
    Created on : Nov 22, 2021, 8:03:11 PM
    Author     : soura
--%>
<%
    if(session.getAttribute("branchUsername")==null){
        response.sendRedirect("branchLogin.jsp");
    }
    else{
%>
<%@page import="java.sql.*, java.util.regex.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@include file="assets/jsp/dbConnection.jsp"%>
<%!
    String success,branchName,nowTime,nowDate,consignmentId,length,width,height,weight,amount,toName,toPhone,toAddress1,toAddress2,toState,toDistrict,toPincode,fromName,fromPhone,fromAddress1,fromAddress2,fromState,fromDistrict,fromPincode;
%>
<%
    if(request.getParameter("submit")!=null && request.getMethod().equals("POST")){
    
    //Data from FORM
    length = request.getParameter("length");
    width = request.getParameter("width");
    height = request.getParameter("height");
    weight = request.getParameter("weight");
    amount = request.getParameter("amount");
    toName = request.getParameter("toName");
    toPhone = request.getParameter("toPhone");
    toAddress1 = request.getParameter("toAddress1");
    toAddress2 = request.getParameter("toAddress2");
    toState = request.getParameter("toState");
    toDistrict = request.getParameter("toDistrict");
    toPincode = request.getParameter("toPincode");
    fromName = request.getParameter("fromName");
    fromPhone = request.getParameter("fromPhone");
    fromAddress1 = request.getParameter("fromAddress1");
    fromAddress2 = request.getParameter("fromAddress2");
    fromState = request.getParameter("fromState");
    fromDistrict = request.getParameter("fromDistrict");
    fromPincode = request.getParameter("fromPincode");
    
    java.util.Date date = new java.util.Date();  
    SimpleDateFormat today = new SimpleDateFormat("dd-MMM-yyyy");
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
    
    nowDate = today.format(date);
    nowTime = timeFormat.format(date);
    
        
    String sql = "SELECT consignment_id FROM ( SELECT CONCAT('PKG',FLOOR(RAND() * 99999999),'IN') AS consignment_id UNION SELECT CONCAT('PKG',FLOOR(RAND() * 99999999),'IN') AS consignment_id ) AS consignment_details WHERE consignment_id NOT IN (SELECT consignment_id FROM consignment_details) LIMIT 1";
    PreparedStatement st=conn.prepareStatement(sql);
    ResultSet rs=st.executeQuery();
    rs.next();
    consignmentId = rs.getString("consignment_id");

    sql = "INSERT INTO consignment_details(consignment_id,book_on,booked_at,branch_id,length,width,height,weight,amount,to_name,to_phone,to_address1,to_address2,to_state,to_district,to_pincode,from_name,from_phone,from_address1,from_address2,from_state,from_district,from_pincode) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    st=conn.prepareStatement(sql);
    st.setString(1,consignmentId);
    st.setString(2,dateFormat.format(date));
    st.setString(3,nowTime);
    st.setString(4,String.valueOf(session.getAttribute("branchUsername")));
    st.setString(5,length);
    st.setString(6,width);
    st.setString(7,height);
    st.setString(8,weight);
    st.setString(9,amount);
    st.setString(10,toName);
    st.setString(11,toPhone);
    st.setString(12,toAddress1);
    st.setString(13,toAddress2);
    st.setString(14,toState);
    st.setString(15,toDistrict);
    st.setString(16,toPincode);
    st.setString(17,fromName);
    st.setString(18,fromPhone);
    st.setString(19,fromAddress1);
    st.setString(20,fromAddress2);
    st.setString(21,fromState);
    st.setString(22,fromDistrict);
    st.setString(23,fromPincode);
    st.executeUpdate();  
    
    sql = "SELECT name FROM branch_details WHERE branch_id=?";
    st=conn.prepareStatement(sql);
    st.setString(1,String.valueOf(session.getAttribute("branchUsername")));
    rs=st.executeQuery();
    rs.next();
    branchName = rs.getString("name");
    
    sql = "INSERT INTO consignment_tracker(consignment_id,date,time,status,remarks) VALUES (?,?,?,?,?)";
    st=conn.prepareStatement(sql);
    st.setString(1,consignmentId); 
    st.setString(2,dateFormat.format(date));
    st.setString(3,nowTime);
    st.setString(4,"Booked");
    st.setString(5,"at "+branchName);
    st.executeUpdate(); 
    
    sql = "INSERT INTO consignment_inventory(consignment_id,branch_id) VALUES (?,?)";
    st=conn.prepareStatement(sql);
    st.setString(1,consignmentId); 
    st.setString(2,String.valueOf(session.getAttribute("branchUsername")));
    st.executeUpdate(); 
    
    success = "success";
    
    conn.close();
    
   }
   else{
        success=null;
   }
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  
  <title>Book Consignment</title>

  <%@include file="assets/jsp/head.jsp"%>	
  
</head>

<body>

  <!-- ======= Header ======= -->
  <%@include file="assets/jsp/nav.jsp"%>
  <!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <%@include file="assets/jsp/sidebar.jsp"%>
  <!-- End Sidebar-->

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Book Consignment</h1>
    </div>

      <div class="row">
        <div class="col-12">


          <div class="card">
            <div class="card-body">
                
            <% 
            if(success!=null){  
            %>
                <div class="alert alert-success alert-dismissible fade show col-md-8 col-xl-6 text-center mx-auto" style="margin-top: 20px;" role="alert">
                    <i class="bi bi-check-circle me-1"></i>
                    Consignment has been successfully booked
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <div id="printSticker" style="margin: 20px 0;">
                    <div style="display: flex;justify-content: space-evenly;" class="row"> 

                        <fieldset style="all: revert; font-weight: 600;width: fit-content;" class="col-6">
                            <legend style="all: revert;">Consignment Tag:</legend>
                            Consignment ID: <%= consignmentId %> <br>
                            Weight: <%= weight %>gm<br><br>
                            <u>Ship To:</u><br>
                            <%= toName %><br>
                            <%= toAddress1 %>,<br><% if(toAddress2.isEmpty()==false){ out.print(toAddress2);%>,<br><%} %>
                            <%= toDistrict %>, <%= toState %>, <%= toPincode %><br><br>
                            <u>From:</u><br>
                            <%= fromName %><br>
                            <%= fromAddress1 %>,<br><% if(fromAddress2.isEmpty()==false){ out.print(fromAddress2);%>,<br><%} %>
                            <%= fromDistrict %>, <%= fromState %>, <%= fromPincode %><br>                       
                        </fieldset>                    
                        <fieldset style="all: revert; font-weight: 600;width: fit-content;" class="col-6">
                            <legend style="all: revert;">Customer Receipt:</legend>
                            Consignment ID: <%= consignmentId %> <br>
                            Dimension: <%= length %>x<%= width %>x<%= height %>cm<br>
                            Weight: <%= weight %>gm<br>
                            Amount: <%= amount %>/-<br>
                            Booked at: <%= branchName %><br>
                            Date & Time: <%= nowDate %> <%= nowTime %><br><br>
                            <u>Ship To:</u><br>
                            <%= toName %><br>
                            <%= toAddress1 %>,<br><% if(toAddress2.isEmpty()==false){ out.print(toAddress2);%>,<br><%} %>
                            <%= toDistrict %>, <%= toState %>, <%= toPincode %><br><br>
                            <u>From:</u><br>
                            <%= fromName %>
                        </fieldset>

                    </div>
                </div>
                <div class="text-center" style="margin-top: 20px;">
                    <button type="button" class="btn btn-danger col-2" onclick="printSticker()">Print</button>
                </div>       
                
            <%
            }
            else{
            %>
            
              <!-- Package Details Form -->
              <form method="POST" action="bookConsignment.jsp">
                  
                  <h5 class="card-title">Package Details</h5>
                  
                  <div class="row g-2">
                      
                    <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                      <label for="length" class="form-label">Length (cm) <span style="color: red;">*</span></label>
                      <input type="number" class="form-control" id="length" name="length" required>
                    </div>
                    <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                      <label for="width" class="form-label">Width (cm) <span style="color: red;">*</span></label>
                      <input type="number" class="form-control" id="width" name="width" required>
                    </div>
                    <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                      <label for="height" class="form-label">Height (cm) <span style="color: red;">*</span></label>
                      <input type="number" class="form-control" id="height" name="height" required>
                    </div>
                    <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                      <label for="weight" class="form-label">Weight (gm) <span style="color: red;">*</span></label>
                      <input type="number" class="form-control" id="weight" name="weight" required>
                    </div>
                    <div class="col-6 col-sm-4 col-md-3 col-lg-2">
                      <label for="amount" class="form-label">Amount (Rs) <span style="color: red;">*</span></label>
                      <input type="number" class="form-control" id="amount" name="amount" required>
                    </div>
                      
                  </div>
                  
                  <h5 class="card-title">Destination Details</h5>
                 
                <div class="row g-2">
                  
                    <div class="col-md-6">
                      <label for="toName" class="form-label">Receiver Name  <span style="color: red;">*</span></label>
                      <input type="text" class="form-control" id="toName" name="toName" required>
                    </div>
                    <div class="col-md-6">
                      <label for="toPhone" class="form-label">Phone No</label>
                      <input type="tel" class="form-control" id="toPhone" name="toPhone" pattern="^\d{10}$">
                    </div>
                    <div class="col-lg-6">
                      <label for="toAddress1" class="form-label">Address <span style="color: red;">*</span></label>
                      <input type="text" class="form-control" id="toAddress1" name="toAddress1" required>
                    </div>
                    <div class="col-lg-6">
                      <label for="toAddress2" class="form-label">Address 2</label>
                      <input type="text" class="form-control" id="toAddress2" name="toAddress2">
                    </div>
                    <div class="col-sm-6 col-md-4">
                      <label for="toState" class="form-label">State  <span style="color: red;">*</span></label>
                      <select id="toState" onchange="district(this.value,'toDistrict')" name="toState" class="form-select" required>
                        <option value="">Choose...</option>
<!--                        <option value="Andhra Pradesh">Andhra Pradesh</option>
                        <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                        <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                        <option value="Assam">Assam</option>
                        <option value="Bihar">Bihar</option>
                        <option value="Chandigarh">Chandigarh</option>
                        <option value="Chhattisgarh">Chhattisgarh</option>
                        <option value="Dadar and Nagar Haveli">Dadar and Nagar Haveli</option>
                        <option value="Daman and Diu">Daman and Diu</option>
                        <option value="Delhi">Delhi</option>
                        <option value="Lakshadweep">Lakshadweep</option>
                        <option value="Puducherry">Puducherry</option>
                        <option value="Goa">Goa</option>
                        <option value="Gujarat">Gujarat</option>
                        <option value="Haryana">Haryana</option>
                        <option value="Himachal Pradesh">Himachal Pradesh</option>
                        <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                        <option value="Jharkhand">Jharkhand</option>
                        <option value="Karnataka">Karnataka</option>
                        <option value="Kerala">Kerala</option>
                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                        <option value="Maharashtra">Maharashtra</option>
                        <option value="Manipur">Manipur</option>
                        <option value="Meghalaya">Meghalaya</option>
                        <option value="Mizoram">Mizoram</option>
                        <option value="Nagaland">Nagaland</option>-->
                        <option value="Odisha">Odisha</option>
<!--                        <option value="Punjab">Punjab</option>
                        <option value="Rajasthan">Rajasthan</option>
                        <option value="Sikkim">Sikkim</option>
                        <option value="Tamil Nadu">Tamil Nadu</option>
                        <option value="Telangana">Telangana</option>
                        <option value="Tripura">Tripura</option>
                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                        <option value="Uttarakhand">Uttarakhand</option>-->
                        <option value="West Bengal">West Bengal</option>
                      </select>
                    </div>
                    <div class="col-sm-6 col-md-4">
                      <label for="toDistrict" class="form-label">District  <span style="color: red;">*</span></label>
                      <select id="toDistrict" name="toDistrict" class="form-select" required>
                        <option value="">Choose...</option>
                        <option>...</option>
                      </select>
                    </div>             
                    <div class="col-md-4">
                      <label for="toPincode" class="form-label">Zip  <span style="color: red;">*</span></label>
                      <input type="text" class="form-control" id="toPincode" name="toPincode" pattern="^\d{6}$" required>
                    </div>
                    
                </div>

                <h5 class="card-title">Sender Details</h5>
                
                <div class="row g-2">
                  
                    <div class="col-md-6">
                      <label for="fromName" class="form-label">Sender Name  <span style="color: red;">*</span></label>
                      <input type="text" class="form-control" id="fromName" name="fromName" required>
                    </div>
                    <div class="col-md-6">
                      <label for="fromPhone" class="form-label">Phone No</label>
                      <input type="tel" class="form-control" id="fromPhone" name="fromPhone" pattern="^\d{10}$">
                    </div>
                    <div class="col-lg-6">
                      <label for="fromAddress1" class="form-label">Address  <span style="color: red;">*</span></label>
                      <input type="text" class="form-control" id="fromAddress1" name="fromAddress1" required>
                    </div>
                    <div class="col-lg-6">
                      <label for="fromAddress2" class="form-label">Address 2</label>
                      <input type="text" class="form-control" id="fromAddress2" name="fromAddress2">
                    </div>
                    <div class="col-sm-6 col-md-4">
                      <label for="fromState" class="form-label">State  <span style="color: red;">*</span></label>
                      <select id="fromState" onchange="district(this.value,'fromDistrict')" name="fromState" class="form-select" required>
                        <option value="">Choose...</option>
<!--                        <option value="Andhra Pradesh">Andhra Pradesh</option>
                        <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                        <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                        <option value="Assam">Assam</option>
                        <option value="Bihar">Bihar</option>
                        <option value="Chandigarh">Chandigarh</option>
                        <option value="Chhattisgarh">Chhattisgarh</option>
                        <option value="Dadar and Nagar Haveli">Dadar and Nagar Haveli</option>
                        <option value="Daman and Diu">Daman and Diu</option>
                        <option value="Delhi">Delhi</option>
                        <option value="Lakshadweep">Lakshadweep</option>
                        <option value="Puducherry">Puducherry</option>
                        <option value="Goa">Goa</option>
                        <option value="Gujarat">Gujarat</option>
                        <option value="Haryana">Haryana</option>
                        <option value="Himachal Pradesh">Himachal Pradesh</option>
                        <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                        <option value="Jharkhand">Jharkhand</option>
                        <option value="Karnataka">Karnataka</option>
                        <option value="Kerala">Kerala</option>
                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                        <option value="Maharashtra">Maharashtra</option>
                        <option value="Manipur">Manipur</option>
                        <option value="Meghalaya">Meghalaya</option>
                        <option value="Mizoram">Mizoram</option>
                        <option value="Nagaland">Nagaland</option>-->
                        <option value="Odisha">Odisha</option>
<!--                        <option value="Punjab">Punjab</option>
                        <option value="Rajasthan">Rajasthan</option>
                        <option value="Sikkim">Sikkim</option>
                        <option value="Tamil Nadu">Tamil Nadu</option>
                        <option value="Telangana">Telangana</option>
                        <option value="Tripura">Tripura</option>
                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                        <option value="Uttarakhand">Uttarakhand</option>-->
                        <option value="West Bengal">West Bengal</option>
                      </select>
                    </div>
                    <div class="col-sm-6 col-md-4">
                      <label for="fromDistrict" class="form-label">District  <span style="color: red;">*</span></label>
                      <select id="fromDistrict" name="fromDistrict" class="form-select" required>
                        <option value="">Choose...</option>
                        <option>...</option>
                      </select>
                    </div>             
                    <div class="col-md-4">
                      <label for="fromPincode" class="form-label">Zip  <span style="color: red;">*</span></label>
                      <input type="text" class="form-control" id="fromPincode" name="fromPincode" pattern="^\d{6}$" required>
                    </div>
                    
                </div>
                    
                <div class="text-center" style="margin-top: 20px;">
                    <button type="submit" class="btn btn-primary col-6 col-md-4 col-lg-3 col-xxl-2" id="submit" name="submit" value="submit">Book Consignment</button>
                    
                </div>                           

              </form><!-- Package Details Form -->
            
            <%  
            }
            %>
            

            </div>
          </div>

        </div>        
    
      </div>
  </main> 
  
    <script>

//        var AndhraPradesh = ["Anantapur","Chittoor","East Godavari","Guntur","Kadapa","Krishna","Kurnool","Prakasam","Nellore","Srikakulam","Visakhapatnam","Vizianagaram","West Godavari"];
//        var ArunachalPradesh = ["Anjaw","Changlang","Dibang Valley","East Kameng","East Siang","Kra Daadi","Kurung Kumey","Lohit","Longding","Lower Dibang Valley","Lower Subansiri","Namsai","Papum Pare","Siang","Tawang","Tirap","Upper Siang","Upper Subansiri","West Kameng","West Siang","Itanagar"];
//        var Assam = ["Baksa","Barpeta","Biswanath","Bongaigaon","Cachar","Charaideo","Chirang","Darrang","Dhemaji","Dhubri","Dibrugarh","Goalpara","Golaghat","Hailakandi","Hojai","Jorhat","Kamrup Metropolitan","Kamrup (Rural)","Karbi Anglong","Karimganj","Kokrajhar","Lakhimpur","Majuli","Morigaon","Nagaon","Nalbari","Dima Hasao","Sivasagar","Sonitpur","South Salmara Mankachar","Tinsukia","Udalguri","West Karbi Anglong"];
//        var Bihar = ["Araria","Arwal","Aurangabad","Banka","Begusarai","Bhagalpur","Bhojpur","Buxar","Darbhanga","East Champaran","Gaya","Gopalganj","Jamui","Jehanabad","Kaimur","Katihar","Khagaria","Kishanganj","Lakhisarai","Madhepura","Madhubani","Munger","Muzaffarpur","Nalanda","Nawada","Patna","Purnia","Rohtas","Saharsa","Samastipur","Saran","Sheikhpura","Sheohar","Sitamarhi","Siwan","Supaul","Vaishali","West Champaran"];
//        var Chhattisgarh = ["Balod","Baloda Bazar","Balrampur","Bastar","Bemetara","Bijapur","Bilaspur","Dantewada","Dhamtari","Durg","Gariaband","Janjgir Champa","Jashpur","Kabirdham","Kanker","Kondagaon","Korba","Koriya","Mahasamund","Mungeli","Narayanpur","Raigarh","Raipur","Rajnandgaon","Sukma","Surajpur","Surguja"];
//        var Goa = ["North Goa","South Goa"];
//        var Gujarat = ["Ahmedabad","Amreli","Anand","Aravalli","Banaskantha","Bharuch","Bhavnagar","Botad","Chhota Udaipur","Dahod","Dang","Devbhoomi Dwarka","Gandhinagar","Gir Somnath","Jamnagar","Junagadh","Kheda","Kutch","Mahisagar","Mehsana","Morbi","Narmada","Navsari","Panchmahal","Patan","Porbandar","Rajkot","Sabarkantha","Surat","Surendranagar","Tapi","Vadodara","Valsad"];
//        var Haryana = ["Ambala","Bhiwani","Charkhi Dadri","Faridabad","Fatehabad","Gurugram","Hisar","Jhajjar","Jind","Kaithal","Karnal","Kurukshetra","Mahendragarh","Mewat","Palwal","Panchkula","Panipat","Rewari","Rohtak","Sirsa","Sonipat","Yamunanagar"];
//        var HimachalPradesh = ["Bilaspur","Chamba","Hamirpur","Kangra","Kinnaur","Kullu","Lahaul Spiti","Mandi","Shimla","Sirmaur","Solan","Una"];
//        var JammuKashmir = ["Anantnag","Bandipora","Baramulla","Budgam","Doda","Ganderbal","Jammu","Kargil","Kathua","Kishtwar","Kulgam","Kupwara","Leh","Poonch","Pulwama","Rajouri","Ramban","Reasi","Samba","Shopian","Srinagar","Udhampur"];
//        var Jharkhand = ["Bokaro","Chatra","Deoghar","Dhanbad","Dumka","East Singhbhum","Garhwa","Giridih","Godda","Gumla","Hazaribagh","Jamtara","Khunti","Koderma","Latehar","Lohardaga","Pakur","Palamu","Ramgarh","Ranchi","Sahebganj","Seraikela Kharsawan","Simdega","West Singhbhum"];
//        var Karnataka = ["Bagalkot","Bangalore Rural","Bangalore Urban","Belgaum","Bellary","Bidar","Vijayapura","Chamarajanagar","Chikkaballapur","Chikkamagaluru","Chitradurga","Dakshina Kannada","Davanagere","Dharwad","Gadag","Gulbarga","Hassan","Haveri","Kodagu","Kolar","Koppal","Mandya","Mysore","Raichur","Ramanagara","Shimoga","Tumkur","Udupi","Uttara Kannada","Yadgir"];
//        var Kerala = ["Alappuzha","Ernakulam","Idukki","Kannur","Kasaragod","Kollam","Kottayam","Kozhikode","Malappuram","Palakkad","Pathanamthitta","Thiruvananthapuram","Thrissur","Wayanad"];
//        var MadhyaPradesh = ["Agar Malwa","Alirajpur","Anuppur","Ashoknagar","Balaghat","Barwani","Betul","Bhind","Bhopal","Burhanpur","Chhatarpur","Chhindwara","Damoh","Datia","Dewas","Dhar","Dindori","Guna","Gwalior","Harda","Hoshangabad","Indore","Jabalpur","Jhabua","Katni","Khandwa","Khargone","Mandla","Mandsaur","Morena","Narsinghpur","Neemuch","Panna","Raisen","Rajgarh","Ratlam","Rewa","Sagar","Satna",
//        "Sehore","Seoni","Shahdol","Shajapur","Sheopur","Shivpuri","Sidhi","Singrauli","Tikamgarh","Ujjain","Umaria","Vidisha"];
//        var Maharashtra = ["Ahmednagar","Akola","Amravati","Aurangabad","Beed","Bhandara","Buldhana","Chandrapur","Dhule","Gadchiroli","Gondia","Hingoli","Jalgaon","Jalna","Kolhapur","Latur","Mumbai City","Mumbai Suburban","Nagpur","Nanded","Nandurbar","Nashik","Osmanabad","Palghar","Parbhani","Pune","Raigad","Ratnagiri","Sangli","Satara","Sindhudurg","Solapur","Thane","Wardha","Washim","Yavatmal"];
//        var Manipur = ["Bishnupur","Chandel","Churachandpur","Imphal East","Imphal West","Jiribam","Kakching","Kamjong","Kangpokpi","Noney","Pherzawl","Senapati","Tamenglong","Tengnoupal","Thoubal","Ukhrul"];
//        var Meghalaya = ["East Garo Hills","East Jaintia Hills","East Khasi Hills","North Garo Hills","Ri Bhoi","South Garo Hills","South West Garo Hills","South West Khasi Hills","West Garo Hills","West Jaintia Hills","West Khasi Hills"];
//        var Mizoram = ["Aizawl","Champhai","Kolasib","Lawngtlai","Lunglei","Mamit","Saiha","Serchhip","Aizawl","Champhai","Kolasib","Lawngtlai","Lunglei","Mamit","Saiha","Serchhip"];
//        var Nagaland = ["Dimapur","Kiphire","Kohima","Longleng","Mokokchung","Mon","Peren","Phek","Tuensang","Wokha","Zunheboto"];
//        var Odisha = ["Angul","Balangir","Balasore","Bargarh","Bhadrak","Boudh","Cuttack","Debagarh","Dhenkanal","Gajapati","Ganjam","Jagatsinghpur","Jajpur","Jharsuguda","Kalahandi","Kandhamal","Kendrapara","Kendujhar","Khordha","Koraput","Malkangiri","Mayurbhanj","Nabarangpur","Nayagarh","Nuapada","Puri","Rayagada","Sambalpur","Subarnapur","Sundergarh"];
        var Odisha = ["Khordha","Puri","Sundergarh"];
//        var Punjab = ["Amritsar","Barnala","Bathinda","Faridkot","Fatehgarh Sahib","Fazilka","Firozpur","Gurdaspur","Hoshiarpur","Jalandhar","Kapurthala","Ludhiana","Mansa","Moga","Mohali","Muktsar","Pathankot","Patiala","Rupnagar","Sangrur","Shaheed Bhagat Singh Nagar","Tarn Taran"];
//        var Rajasthan = ["Ajmer","Alwar","Banswara","Baran","Barmer","Bharatpur","Bhilwara","Bikaner","Bundi","Chittorgarh","Churu","Dausa","Dholpur","Dungarpur","Ganganagar","Hanumangarh","Jaipur","Jaisalmer","Jalore","Jhalawar","Jhunjhunu","Jodhpur","Karauli","Kota","Nagaur","Pali","Pratapgarh","Rajsamand","Sawai Madhopur","Sikar","Sirohi","Tonk","Udaipur"];
//        var Sikkim = ["East Sikkim","North Sikkim","South Sikkim","West Sikkim"];
//        var TamilNadu = ["Ariyalur","Chennai","Coimbatore","Cuddalore","Dharmapuri","Dindigul","Erode","Kanchipuram","Kanyakumari","Karur","Krishnagiri","Madurai","Nagapattinam","Namakkal","Nilgiris","Perambalur","Pudukkottai","Ramanathapuram","Salem","Sivaganga","Thanjavur","Theni","Thoothukudi","Tiruchirappalli","Tirunelveli","Tiruppur","Tiruvallur","Tiruvannamalai","Tiruvarur","Vellore","Viluppuram","Virudhunagar"];
//        var Telangana = ["Adilabad","Bhadradri Kothagudem","Hyderabad","Jagtial","Jangaon","Jayashankar","Jogulamba","Kamareddy","Karimnagar","Khammam","Komaram Bheem","Mahabubabad","Mahbubnagar","Mancherial","Medak","Medchal","Nagarkurnool","Nalgonda","Nirmal","Nizamabad","Peddapalli","Rajanna Sircilla","Ranga Reddy","Sangareddy","Siddipet","Suryapet","Vikarabad","Wanaparthy","Warangal Rural","Warangal Urban","Yadadri Bhuvanagiri"];
//        var Tripura = ["Dhalai","Gomati","Khowai","North Tripura","Sepahijala","South Tripura","Unakoti","West Tripura"];
//        var UttarPradesh = ["Agra","Aligarh","Allahabad","Ambedkar Nagar","Amethi","Amroha","Auraiya","Azamgarh","Baghpat","Bahraich","Ballia","Balrampur","Banda","Barabanki","Bareilly","Basti","Bhadohi","Bijnor","Budaun","Bulandshahr","Chandauli","Chitrakoot","Deoria","Etah","Etawah","Faizabad","Farrukhabad","Fatehpur","Firozabad","Gautam Buddha Nagar","Ghaziabad","Ghazipur","Gonda","Gorakhpur","Hamirpur","Hapur","Hardoi","Hathras","Jalaun","Jaunpur","Jhansi","Kannauj","Kanpur Dehat","Kanpur Nagar","Kasganj","Kaushambi","Kheri","Kushinagar","Lalitpur","Lucknow","Maharajganj","Mahoba","Mainpuri","Mathura","Mau","Meerut","Mirzapur","Moradabad","Muzaffarnagar","Pilibhit","Pratapgarh","Raebareli","Rampur","Saharanpur","Sambhal","Sant Kabir Nagar","Shahjahanpur","Shamli","Shravasti","Siddharthnagar","Sitapur","Sonbhadra","Sultanpur","Unnao","Varanasi"];
//        var Uttarakhand  = ["Almora","Bageshwar","Chamoli","Champawat","Dehradun","Haridwar","Nainital","Pauri","Pithoragarh","Rudraprayag","Tehri","Udham Singh Nagar","Uttarkashi"];
        var WestBengal = ["Hooghly","Kolkata","Nadia"];
//        var WestBengal = ["Alipurduar","Bankura","Birbhum","Cooch Behar","Dakshin Dinajpur","Darjeeling","Hooghly","Howrah","Jalpaiguri","Jhargram","Kalimpong","Kolkata","Malda","Murshidabad","Nadia","North 24 Parganas","Paschim Bardhaman","Paschim Medinipur","Purba Bardhaman","Purba Medinipur","Purulia","South 24 Parganas","Uttar Dinajpur"];
//        var AndamanNicobar = ["Nicobar","North Middle Andaman","South Andaman"];
//        var Chandigarh = ["Chandigarh"];
//        var DadraHaveli = ["Dadra Nagar Haveli"];
//        var DamanDiu = ["Daman","Diu"];
//        var Delhi = ["Central Delhi","East Delhi","New Delhi","North Delhi","North East Delhi","North West Delhi","Shahdara","South Delhi","South East Delhi","South West Delhi","West Delhi"];
//        var Lakshadweep = ["Lakshadweep"];
//        var puducherry = ["Karaikal","Mahe","Puducherry","Yanam"];


        function district(state,optionDistrict){
            
          var optionsList;
          var htmlString = "";

          switch (state) {
            case "Andhra Pradesh":
                optionsList = AndhraPradesh;
                break;
            case "Arunachal Pradesh":
                optionsList = ArunachalPradesh;
                break;
            case "Assam":
                optionsList = Assam;
                break;
            case "Bihar":
                optionsList = Bihar;
                break;
            case "Chhattisgarh":
                optionsList = Chhattisgarh;
                break;
            case "Goa":
                optionsList = Goa;
                break;
            case  "Gujarat":
                optionsList = Gujarat;
                break;
            case "Haryana":
                optionsList = Haryana;
                break;
            case "Himachal Pradesh":
                optionsList = HimachalPradesh;
                break;
            case "Jammu and Kashmir":
                optionsList = JammuKashmir;
                break;
            case "Jharkhand":
                optionsList = Jharkhand;
                break;
            case  "Karnataka":
                optionsList = Karnataka;
                break;
            case "Kerala":
                optionsList = Kerala;
                break;
            case  "Madhya Pradesh":
                optionsList = MadhyaPradesh;
                break;
            case "Maharashtra":
                optionsList = Maharashtra;
                break;
            case  "Manipur":
                optionsList = Manipur;
                break;
            case "Meghalaya":
                optionsList = Meghalaya ;
                break;
            case  "Mizoram":
                optionsList = Mizoram;
                break;
            case "Nagaland":
                optionsList = Nagaland;
                break;
            case  "Odisha":
                optionsList = Odisha;
                break;
            case "Punjab":
                optionsList = Punjab;
                break;
            case  "Rajasthan":
                optionsList = Rajasthan;
                break;
            case "Sikkim":
                optionsList = Sikkim;
                break;
            case  "Tamil Nadu":
                optionsList = TamilNadu;
                break;
            case  "Telangana":
                optionsList = Telangana;
                break;
            case "Tripura":
                optionsList = Tripura ;
                break;
            case  "Uttarakhand":
                optionsList = Uttarakhand;
                break;
            case  "Uttar Pradesh":
                optionsList = UttarPradesh;
                break;
            case "West Bengal":
                optionsList = WestBengal;
                break;
            case  "Andaman and Nicobar Islands":
                optionsList = AndamanNicobar;
                break;
            case "Chandigarh":
                optionsList = Chandigarh;
                break;
            case  "Dadar and Nagar Haveli":
                optionsList = DadraHaveli;
                break;
            case "Daman and Diu":
                optionsList = DamanDiu;
                break;
            case  "Delhi":
                optionsList = Delhi;
                break;
            case "Lakshadweep":
                optionsList = Lakshadweep ;
                break;
            case  "Puducherry":
                optionsList = puducherry;
                break;
        }


          for(var i = 0; i < optionsList.length; i++){
            htmlString = htmlString+"<option value='"+ optionsList[i] +"'>"+ optionsList[i] +"</option>";
          }
          document.getElementById(optionDistrict).innerHTML=htmlString;

        }
        
        function printSticker() {
            var divContents = document.getElementById("printSticker").innerHTML;
            var a = window.open('', '', '');
            a.document.write('<html>');
            a.document.write('<body >');
            a.document.write(divContents);
            a.document.write('</body></html>');
            a.document.close();
            a.print();
        }
    </script>

  <%@include file="assets/jsp/footer.jsp"%>

</body>

</html>
<% } %>