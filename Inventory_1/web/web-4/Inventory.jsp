<!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page import="java.sql.*;"%>
<%Class.forName("com.mysql.jdbc.Driver");%>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <title>Shoppy admin panel| Home </title>
        <!-- custom-theme -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Esteem Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- //custom-theme -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/component.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/export.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/flipclock.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/circles.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style_grid.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />

        <!-- font-awesome-icons -->
        <link href="css/font-awesome.css" rel="stylesheet"> 
        <!-- //font-awesome-icons -->
        <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
    </head>
    <body>
        <%!
            public class viewDetails {

                String url = "jdbc:mysql://localhost:3306/grocery";
                String username = "root";
                String password = "sharana";

                Connection connection = null;
                PreparedStatement selectEmployee = null;
                ResultSet resultSet = null;

                public viewDetails() {

                    try {
                        connection = DriverManager.getConnection(url, username, password);

                        selectEmployee = connection.prepareStatement("Select pid,name,quantity from grocery.product where quantity<10");
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                public ResultSet setView() {

                    try {

                        resultSet = selectEmployee.executeQuery();
                    } catch (SQLException e) {

                        e.printStackTrace();
                    }

                    return resultSet;
                }
            }

        %>
        <%

            viewDetails details = new viewDetails();
            ResultSet view = details.setView();
        %>
        <!-- banner -->
        <div class="wthree_agile_admin_info">
            <!-- /w3_agileits_top_nav-->
            <!-- /nav-->
            <div class="w3_agileits_top_nav">
                <ul id="gn-menu" class="gn-menu-main">
                    <!-- /nav_agile_w3l -->
                    <li class="gn-trigger">
                        <a class="gn-icon gn-icon-menu"><i class="fa fa-bars" aria-hidden="true"></i><span>Menu</span></a>
                        <nav class="gn-menu-wrapper">
                            <div class="gn-scroller scrollbar1">
                                <ul class="gn-menu agile_menu_drop">
                                    <li><a href="main-page.html"> <i class="fa fa-tachometer"></i> Dashboard</a></li>
                                    <li>
                                        <a href="Salary.jsp"><i class="fa fa-cogs" aria-hidden="true"></i>Salary Management<i class="fa fa-angle-down" aria-hidden="true"></i></a> 

                                    </li>
                                    <li>
                                        <a href="Supplier.jsp"> <i class="fa fa-file-text-o" aria-hidden="true"></i>Supplier management <i class="fa fa-angle-down" aria-hidden="true"></i></a> 

                                    </li>
                                    <li><a href="Inventory.jsp"> <i class="fa fa-table" aria-hidden="true"></i> Inventory Management</a></li>
                                    <li><a href="Utility.jsp"><i class="fa fa-list" aria-hidden="true"></i>Utility and Accounts <i class="fa fa-angle-down" aria-hidden="true"> </i></a> 

                                    </li>

                                    <li><a href="complains.jsp"> <i class="fa fa-line-chart" aria-hidden="true"></i> Complains And Returns</a></li>


                                </ul>
                            </div><!-- /gn-scroller -->
                        </nav>
                    </li>
                    <!-- //nav_agile_w3l -->
                    <li class="second logo"><h1><a href="main-page.jsp"><i class="fa fa-graduation-cap" aria-hidden="true"></i>Shoppy</a></h1></li>
                    <li class="second admin-pic">
                        <ul class="top_dp_agile">
                            <li class="dropdown profile_details_drop">
                                <a href="login.jsp" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    <div class="profile_img">	
                                        <span class="prfil-img"><img src="images/admin.jpg" alt=""> </span> 
                                    </div>	
                                </a>
                                <ul class="dropdown-menu drp-mnu">
                                    <li> <a href="setings.jsp"><i class="fa fa-cog"></i> Settings</a> </li> 
                                    <li> <a href="profile.jsp"><i class="fa fa-user"></i> Profile</a> </li> 
                                    <li> <a href="logout.jsp"><i class="fa fa-sign-out"></i> Logout</a> </li>
                                </ul>
                            </li>

                        </ul>
                    </li>
                    <li class="second top_bell_nav">
                        <ul class="top_dp_agile ">
                            <li class="dropdown head-dpdn">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true"><i class="fa fa-bell-o" aria-hidden="true"></i> <span class="badge blue">4</span></a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <div class="notification_header">
                                            <h3>Stock On low</h3>


                                        </div>
                                    </li>
                                    <li><a href="notification.jsp">



                                        </a></li>
                                    <li class="odd"><a href="#">
                                            <div class="user_img"></div>
                                            <div class="notification_desc">
                                                <table>
                                                    <%
                                                while (view.next()) {%>

                                                    
                                                <tr><h6>Product : <%= view.getString("name")%></h6></tr>
                                                <tr><p>ID  : <%= view.getString("pid")%></p></tr>


                                                <tr><p><span>Available : <%= view.getString("quantity")%></span></p></tr>

                                            

                                                    <% }%>
                                                    
                                                </table>
                                                        
                                            
                                            </div>







                                            <div class="clearfix"></div>	
                                        </a></li>


                                    <li>
                                        <div class="notification_bottom">
                                            <a href="#">See all Notifications</a>
                                        </div> 
                                    </li>
                                </ul>
                            </li>

                        </ul>
                    </li>


                    <li class="second w3l_search">

                        <form action="#" method="post">
                            <input type="search" name="search" placeholder="Search here..." required="">
                            <button class="btn btn-default" type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                        </form>

                    </li>
                    <li class="second full-screen">
                        <section class="full-top">
                            <button id="toggle"><i class="fa fa-arrows-alt" aria-hidden="true"></i></button>	
                        </section>
                    </li>

                </ul>
                <!-- //nav -->

            </div>
            <div class="clearfix"></div>
            <a href="calendar.html"></a>
            <!-- //w3_agileits_top_nav-->
            <!-- /inner_content-->
            <div class="inner_content">
                <!-- /inner_content_w3_agile_info-->
                <div class="inner_content_w3_agile_info">
                    <!-- /agile_top_w3_grids-->
                    <div class="agile_top_w3_grids">
                        <ul class="ca-menu">
                            <li>
                                <a href="Salary.jsp">

                                    <i class="fa fa-building-o" aria-hidden="true"></i>
                                    <div class="ca-content">
                                        <h4 class="ca-main">Salary</h4>
                                        <h3 class="ca-sub">Salary Management</h3>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="Supplier.jsp">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                    <div class="ca-content">
                                        <h4 class="ca-main one">Supplier</h4>
                                        <h3 class="ca-sub one">Supplier Management</h3>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="Inventory.jsp">
                                    <i class="fa fa-database" aria-hidden="true"></i>
                                    <div class="ca-content">
                                        <h4 class="ca-main two">Inventory</h4>
                                        <h3 class="ca-sub two">Inventory Management</h3>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-tasks" aria-hidden="true"></i>
                                    <div class="ca-content">
                                        <h4 class="ca-main three">Accounts</h4>
                                        <h3 class="ca-sub three">Utility and Accounts</h3>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="Complains.jsp">
                                    <i class="fa fa-clone" aria-hidden="true"></i>
                                    <div class="ca-content">
                                        <h4 class="ca-main four">complaints</h4>
                                        <h3 class="ca-sub four">Returns and Complaints</h3>
                                    </div>
                                </a>
                            </li>
                            <div class="clearfix"></div>
                        </ul>
                    </div>
                    <!-- //agile_top_w3_grids-->
                    <!-- /agile_top_w3_post_sections-->
                    <div class="agile_top_w3_post_sections">
                        <div class="col-md-6 agile_top_w3_post agile_info_shadow">
                            <div class="img_wthee_post">
                                <h3 class="w3_inner_tittle">Menu</h3>
                                <div class="stats-wrap">
                                    <div class="count_info"><h4 class="count">View Products </h4><span class="year"></span></div>
                                    <div class="year-info"><p class="text-no"><a href="view.jsp">View </a></p><span class="year"></span></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="stats-wrap">
                                    <div class="count_info"><h4 class="count">Add Products </h4><span class="year"></span></div>
                                    <div class="year-info"><p class="text-no"><a  href="add.jsp">Add</a></p><span class="year"></span></div>
                                    <div class="clearfix"></div>
                                </div>

                                <div class="stats-wrap">
                                    <div class="count_info"><h4 class="count">Update Product</h4><span class="year"></span></div>
                                    <div class="year-info"><p class="text-no"><a href="updateProduct.jsp">Update</a></p><span class="year"></span></div>
                                    <div class="clearfix"></div>
                                </div>

                                <div class="stats-wrap">
                                    <div class="count_info"><h4 class="count"></h4><span class="year"></span></div>

                                    <div class="clearfix"></div>
                                </div>

                                <div class="stats-wrap">
                                    <div class="count_info"><h4 class="count">Delete Products</h4><span class="year"></span></div>
                                    <div class="year-info"><p class="text-no"><a href="delete.jsp">Delete</a></p><span class="year"></span></div>
                                    <div class="clearfix"></div>
                                </div>


                                <div class="stats-wrap">
                                    <div class="count_info"><h4 class="count">Restock</h4><span class="year"></span></div>
                                    <div class="year-info"><p class="text-no"><a href="restock.jsp">Restock</a></p><span class="year"></span></div>
                                    <div class="clearfix"></div>
                                </div>




                                <div class="stats-wrap">
                                    <div class="count_info"><h4 class="count"></h4><span class="year"></span></div>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="stats-wrap">
                                    <div class="count_info"><h4 class="count"></h4><span class="year"></span></div>
                                    <div class="year-info"><p class="text-no"><a href="main-page.html">back</a></p><span class="year"></span></div>
                                    <div class="clearfix"></div>
                                </div>


                                <div class="stats-wrap">
                                    <div class="count_info"><h4 class="count"></h4><span class="year"></span></div>

                                    <div class="clearfix"></div>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-6 agile_top_w3_post_info agile_info_shadow">
                            <div class="img_wthee_post1">
                                <h3 class="w3_inner_tittle"> Flip Clock</h3>
                                <div class="main-example">
                                    <div class="clock"></div>
                                    <div class="message"></div>

                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>

                    <!-- //agile_top_w3_post_sections-->
                    <!-- /w3ls_agile_circle_progress-->
                    <
                    <!-- /w3ls_agile_circle_progress-->
                    <!-- /chart_agile-->

                    <!-- /w3ls_agile_circle_progress-->

                    <!-- /w3ls_agile_circle_progress-->
                    <!--/prograc-blocks_agileits-->





                    <!--//prograc-blocks_agileits-->
                    <!-- /bottom_agileits_grids-->


                    <!-- //bottom_agileits_grids-->
                    <!-- /weather_w3_agile_info-->

                    <!-- //weather_w3_agile_info-->
                    <!-- /social_media-->

                    <!-- banner -->
                    <!--copy rights start here-->
                    <div class="copyrights">
                        <p>© 2018 Shoppy. All Rights Reserved | Design by  <a href="http://w3layouts.com/" target="_blank">Al-Muris(pvt)LTD</a> </p>
                    </div>	
                    <!--copy rights end here-->
                    <!-- js -->

                    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>

                    <!-- /amcharts -->
                    <script src="js/amcharts.js"></script>
                    <script src="js/serial.js"></script>
                    <script src="js/export.js"></script>	
                    <script src="js/light.js"></script>
                    <!-- Chart code -->
                    <script>
                        var chart = AmCharts.makeChart("chartdiv", {
                            "theme": "light",
                            "type": "serial",
                            "startDuration": 2,
                            "dataProvider": [{
                                    "country": "USA",
                                    "visits": 4025,
                                    "color": "#FF0F00"
                                }, {
                                    "country": "China",
                                    "visits": 1882,
                                    "color": "#FF6600"
                                }, {
                                    "country": "Japan",
                                    "visits": 1809,
                                    "color": "#FF9E01"
                                }, {
                                    "country": "Germany",
                                    "visits": 1322,
                                    "color": "#FCD202"
                                }, {
                                    "country": "UK",
                                    "visits": 1122,
                                    "color": "#F8FF01"
                                }, {
                                    "country": "France",
                                    "visits": 1114,
                                    "color": "#B0DE09"
                                }, {
                                    "country": "India",
                                    "visits": 984,
                                    "color": "#04D215"
                                }, {
                                    "country": "Spain",
                                    "visits": 711,
                                    "color": "#0D8ECF"
                                }, {
                                    "country": "Netherlands",
                                    "visits": 665,
                                    "color": "#0D52D1"
                                }, {
                                    "country": "Russia",
                                    "visits": 580,
                                    "color": "#2A0CD0"
                                }, {
                                    "country": "South Korea",
                                    "visits": 443,
                                    "color": "#8A0CCF"
                                }, {
                                    "country": "Canada",
                                    "visits": 441,
                                    "color": "#CD0D74"
                                }, {
                                    "country": "Brazil",
                                    "visits": 395,
                                    "color": "#754DEB"
                                }, {
                                    "country": "Italy",
                                    "visits": 386,
                                    "color": "#DDDDDD"
                                }, {
                                    "country": "Taiwan",
                                    "visits": 338,
                                    "color": "#333333"
                                }],
                            "valueAxes": [{
                                    "position": "left",
                                    "axisAlpha": 0,
                                    "gridAlpha": 0
                                }],
                            "graphs": [{
                                    "balloonText": "[[category]]: <b>[[value]]</b>",
                                    "colorField": "color",
                                    "fillAlphas": 0.85,
                                    "lineAlpha": 0.1,
                                    "type": "column",
                                    "topRadius": 1,
                                    "valueField": "visits"
                                }],
                            "depth3D": 40,
                            "angle": 30,
                            "chartCursor": {
                                "categoryBalloonEnabled": false,
                                "cursorAlpha": 0,
                                "zoomable": false
                            },
                            "categoryField": "country",
                            "categoryAxis": {
                                "gridPosition": "start",
                                "axisAlpha": 0,
                                "gridAlpha": 0

                            },
                            "export": {
                                "enabled": true
                            }

                        }, 0);
                    </script>
                    <!-- Chart code -->
                    <script>
                        var chart = AmCharts.makeChart("chartdiv1", {
                            "type": "serial",
                            "theme": "light",
                            "legend": {
                                "horizontalGap": 10,
                                "maxColumns": 1,
                                "position": "right",
                                "useGraphSettings": true,
                                "markerSize": 10
                            },
                            "dataProvider": [{
                                    "year": 2017,
                                    "europe": 2.5,
                                    "namerica": 2.5,
                                    "asia": 2.1,
                                    "lamerica": 0.3,
                                    "meast": 0.2,
                                    "africa": 0.1
                                }, {
                                    "year": 2016,
                                    "europe": 2.6,
                                    "namerica": 2.7,
                                    "asia": 2.2,
                                    "lamerica": 0.3,
                                    "meast": 0.3,
                                    "africa": 0.1
                                }, {
                                    "year": 2015,
                                    "europe": 2.8,
                                    "namerica": 2.9,
                                    "asia": 2.4,
                                    "lamerica": 0.3,
                                    "meast": 0.3,
                                    "africa": 0.1
                                }],
                            "valueAxes": [{
                                    "stackType": "regular",
                                    "axisAlpha": 0.5,
                                    "gridAlpha": 0
                                }],
                            "graphs": [{
                                    "balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
                                    "fillAlphas": 0.8,
                                    "labelText": "[[value]]",
                                    "lineAlpha": 0.3,
                                    "title": "Europe",
                                    "type": "column",
                                    "color": "#000000",
                                    "valueField": "europe"
                                }, {
                                    "balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
                                    "fillAlphas": 0.8,
                                    "labelText": "[[value]]",
                                    "lineAlpha": 0.3,
                                    "title": "North America",
                                    "type": "column",
                                    "color": "#000000",
                                    "valueField": "namerica"
                                }, {
                                    "balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
                                    "fillAlphas": 0.8,
                                    "labelText": "[[value]]",
                                    "lineAlpha": 0.3,
                                    "title": "Asia-Pacific",
                                    "type": "column",
                                    "color": "#000000",
                                    "valueField": "asia"
                                }, {
                                    "balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
                                    "fillAlphas": 0.8,
                                    "labelText": "[[value]]",
                                    "lineAlpha": 0.3,
                                    "title": "Latin America",
                                    "type": "column",
                                    "color": "#000000",
                                    "valueField": "lamerica"
                                }, {
                                    "balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
                                    "fillAlphas": 0.8,
                                    "labelText": "[[value]]",
                                    "lineAlpha": 0.3,
                                    "title": "Middle-East",
                                    "type": "column",
                                    "color": "#000000",
                                    "valueField": "meast"
                                }, {
                                    "balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
                                    "fillAlphas": 0.8,
                                    "labelText": "[[value]]",
                                    "lineAlpha": 0.3,
                                    "title": "Africa",
                                    "type": "column",
                                    "color": "#000000",
                                    "valueField": "africa"
                                }],
                            "rotate": true,
                            "categoryField": "year",
                            "categoryAxis": {
                                "gridPosition": "start",
                                "axisAlpha": 0,
                                "gridAlpha": 0,
                                "position": "left"
                            },
                            "export": {
                                "enabled": true
                            }
                        });
                    </script>

                    <!-- //amcharts -->
                    <script src="js/chart1.js"></script>
                    <script src="js/Chart.min.js"></script>
                    <script src="js/modernizr.custom.js"></script>

                    <script src="js/classie.js"></script>
                    <script src="js/gnmenu.js"></script>
                    <script>
                        new gnMenu(document.getElementById('gn-menu'));
                    </script>
                    <!-- script-for-menu -->

                    <!-- /circle-->
                    <script type="text/javascript" src="js/circles.js"></script>
                    <script>
                        var colors = [
                            ['#ffffff', '#fd9426'], ['#ffffff', '#fc3158'], ['#ffffff', '#53d769'], ['#ffffff', '#147efb']
                        ];
                        for (var i = 1; i <= 7; i++) {
                            var child = document.getElementById('circles-' + i),
                                    percentage = 30 + (i * 10);

                            Circles.create({
                                id: child.id,
                                percentage: percentage,
                                radius: 80,
                                width: 10,
                                number: percentage / 1,
                                text: '%',
                                colors: colors[i - 1]
                            });
                        }

                    </script>
                    <!-- //circle -->
                    <!--skycons-icons-->
                    <script src="js/skycons.js"></script>
                    <script>
                        var icons = new Skycons({"color": "#fcb216"}),
                                list = [
                                    "partly-cloudy-day"
                                ],
                                i;

                        for (i = list.length; i--; )
                            icons.set(list[i], list[i]);
                        icons.play();
                    </script>
                    <script>
                        var icons = new Skycons({"color": "#fff"}),
                                list = [
                                    "clear-night", "partly-cloudy-night", "cloudy", "clear-day", "sleet", "snow", "wind", "fog"
                                ],
                                i;

                        for (i = list.length; i--; )
                            icons.set(list[i], list[i]);
                        icons.play();
                    </script>
                    <!--//skycons-icons-->
                    <!-- //js -->
                    <script src="js/screenfull.js"></script>
                    <script>
                        $(function () {
                            $('#supported').text('Supported/allowed: ' + !!screenfull.enabled);

                            if (!screenfull.enabled) {
                                return false;
                            }



                            $('#toggle').click(function () {
                                screenfull.toggle($('#container')[0]);
                            });
                        });
                    </script>
                    <script src="js/flipclock.js"></script>

                    <script type="text/javascript">
                        var clock;

                        $(document).ready(function () {

                            clock = $('.clock').FlipClock({
                                clockFace: 'HourlyCounter'
                            });
                        });
                    </script>
                    <script src="js/bars.js"></script>
                    <script src="js/jquery.nicescroll.js"></script>
                    <script src="js/scripts.js"></script>

                    <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>


                    </body>
                    </html>