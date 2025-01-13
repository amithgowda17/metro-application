<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page isELIgnored="false" %>
        <html>

        <head>
            <title>This is Coders World</title>
            <link rel="icon" type="image/x-icon" href="https://www.x-workz.in/Logo.png" />
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-..." crossorigin="anonymous">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
        </head>

        <body>
             <header class="bg-dark text-white text-center py-3">
                   <div class="d-flex justify-content-between align-items-center">

                       <img src="https://www.x-workz.in/Logo.png" alt="Logo" style="max-height: 50px;">
                       <div class="dropdown mb-1">
                           <img src="readImage/${details.imageName}" class="rounded-circle mx-2" alt="img" width="90"
                               data-bs-toggle="modal" data-bs-target="#imageModal" />
                           <a class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split mx-2" href=""
                               role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true"
                               aria-expanded="false">
                               ${details.firstName}
                           </a>
                           <button>
                                                               <a href="back?email=${details.email}" style="color: black; text-decoration: none">Home</a>
                                                           </button>
                           <button><a class="dropdown-item" href="metroTimings?email=${details.email}">Metro Timings</a></button>
                           <div class="dropdown-menu" aria-labelledby="${details.firstName}">
                               <a class="dropdown-item" href="userProfileUpdate?email=${details.email}">Profile</a>
                               <a class="dropdown-item" href="smartCards?email=${details.email}">Smart Cards</a>
                               <a class="dropdown-item" href="userCanLoginHere">Log out</a>
                           </div>
                       </div>
                   </div>
               </header>
            <br>
            <div style="text-align: center;">
                <img src="https://th.bing.com/th?id=OLC.Kj96CPQlp0+sew480x360&rs=1&pid=ImgDetMain"
                    alt="Descriptive Alt Text" class="img-fluid"
                    style="max-height: 500px; max-width: 500px; display: block; margin: auto;">
            </div>
            <h1><i>Information</i></h1>
            <p>Bangalore (Namma) Metro is an urban Mass Rapid Transit System (MRTS) with 2 lines and 51 stations serving
                Bengaluru, Karnataka’s capital and largest city</p>
            <p>Construction for Bangalore Metro Phase 1 with 42.30 km of routes started in April 2007. Its first
                section, connecting Baiyyappanahalli – MG Road on the Purple Line, opened up in 2011. The 6th (and
                final) section was inaugurated by India’s President on June 17, 2017, and commercial operations started
                on the next day.</p>
            <p>Construction work on the 73.921 km Bangalore Metro Phase 2's first new section (Mysore Road Pattanagere,
                Reach-2A of Purple Line) started in September 2015. The project faced funding issues due to which a
                majority of civil construction contracts were awarded only in the first half of 2017.</p>
            <p>While the Green Line’s extension to Silk Institute became operational in January 2021, the entire phase,
                including a 13.9 km underground section of the Pink Line, is expected to be ready no sooner than 2024
                after which the metro network will become 116.25 km long.</p>
            <p>Bangalore Metro’s Phase 3 project with routes totaling 44.65 km is currently pending approval from the
                Central Government’s cabinet. Earlier 105 km of routes were planned. From that, 18 km (Central Silk
                Board – KR Puram) and 38 km (KR Puram – KIAL Airport) of lines have been expedited and are currently
                being built in parallel with Phase 2 under Phase 2A and Phase 2B respectively.</p>

            <h2><i>System Specifications</i></h2>
            <ul>
                <li>Top Speed: 80 kmph</li>
                <li>Average Speed: 34 kmph</li>
                <li>Track Gauge: Standard Gauge – 1435 mm</li>
                <li>Electrification: 750 V DC Third Rail</li>
                <li>Signalling: Distance to Go (Purple & Green lines), CBTC (Yellow & Pink lines)</li>
            </ul>

            <h2><i>Key Figures</i></h2>
            <ul>
                <li>Operational: 75.20 km</li>
                <li>Under Construction: 94.81 km</li>
                <li>Approved: 44.65 km</li>
                <li>Proposed: 37 km</li>
                <li>Daily Ridership: 7.5 lakh/day (October 2023)</li>
                <li>Rolling Stock: 342 coaches (57 train-sets x 6) supplied by BEML and 216 coaches (36 x 6) to be
                    supplied by CRRC</li>
            </ul>

            <h2><i>Operational Lines (Phase 1, Phase 2)</i></h2>
            <ul>
                <li>Line-1 – Purple Line: Challaghatta – Whitefield (Kadugodi) (42.17 km, 37 stations)</li>
                <li>Line-2 – Green Line: Madavara – Silk Institute (33.03 km, 32 stations)</li>
            </ul>

            <h2><i>Under Construction Lines (Phase 2, Phase 2A, Phase 2B)</i></h2>
            <ul>
                <li>Line-2 – Green Line: Silk Institute – Anjanapura Depot (0.50 km, 0 stations)</li>
                <li>Line-3 – Yellow Line: RV Road – Bommasandra (19.143 km, 16 stations)</li>
                <li>Line-4 – Pink Line: Gottigere (Kalena Agrahara) – Nagawara (21.386 km, 18 stations)</li>
                <li>Line-5 – Blue Line: Central Silkboard – KR Puram (18.236 km, 13 stations, “ORR Line”)</li>
                <li>Line-5 – Blue Line: KR Puram – Hebbal – KIAL Terminals (37 km, 17 stations, “Airport Line”)</li>
            </ul>

            <h2><i>Approved Lines (Phase 3)</i></h2>
            <ul>
                <li>Line-6 – Orange Line: Kempapura – JP Nagar 4th Phase (32.15 km, 22 stations)</li>
                <li>Line-7 – Silver Line: Kadabagare – Hosahalli (12.5 km, 9 stations)</li>
            </ul>

            <h2><i>Proposed Lines Pending Approvals (Phase 3A)</i></h2>
            <ul>
                <li>Line-8 – Red Line: Hebbal – Sarjapur (37 km)</li>
            </ul>

            <div>
               <footer class="bg-dark py-3 mt-auto">
                       <div class="container-fluid">
                           <div class="row justify-content-center">
                               <div class="col-md-6 text-center">
                                   <p class="text-white mb-0">Copyright &copy; 2024, All Rights Reserved</p>
                               </div>
                           </div>
                       </div>
                   </footer>
        </body>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
                integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
                integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
                crossorigin="anonymous"></script>

        </html>