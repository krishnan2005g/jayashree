<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Will You Marry Me?</title>

    
    <style>
        /* CSS Variables */
        :root {
            --primary: #ff4d4d;
            --secondary: #ff9e9e;
            --dark: #0f0c29;
            --mid: #302b63;
            --light: #f8f9fa;
            --shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            --glow: 0 0 20px rgba(255, 77, 77, 0.7);
        }

        /* Base Reset */
        *, *::before, *::after {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Smooth Scrolling */
        html {
            scroll-behavior: smooth;
            overflow-x: hidden;
        }

        /* Body Styles */
        body {
            font-family: 'Montserrat', sans-serif;
            color: var(--light);
            background: linear-gradient(135deg, var(--dark), var(--mid));
            overflow-x: hidden;
            perspective: 1000px;
            min-height: 100vh;
        }

        /* Typography */
        h1, h2, h3 {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            line-height: 1.2;
        }

        /* Particle Canvas */
        #particles-js {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -2;
            background: transparent;
        }

        /* Floating Elements Container */
        .floating-elements {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: -1;
            overflow: hidden;
        }

        /* Floating Heart Animation */
        .floating-heart {
            position: absolute;
            opacity: 0;
            font-size: 1.5rem;
            animation: float 8s linear infinite;
            filter: drop-shadow(var(--glow));
            z-index: 1;
        }

        @keyframes float {
            0% {
                transform: translateY(0) rotate(0deg) scale(0.5);
                opacity: 0;
            }
            10% {
                opacity: 0.8;
            }
            90% {
                opacity: 0.8;
            }
            100% {
                transform: translateY(-100vh) rotate(360deg) scale(1.2);
                opacity: 0;
            }
        }

        /* Diamond Animation */
        .diamond {
            position: absolute;
            width: 100px;
            height: 100px;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            opacity: 0;
            transition: all 1s ease;
            z-index: 2;
            pointer-events: none;
            filter: drop-shadow(var(--glow));
        }

        .diamond svg {
            width: 100%;
            height: 100%;
            animation: floatDiamond 4s ease-in-out infinite;
        }

        @keyframes floatDiamond {
            0%, 100% {
                transform: translateY(0) rotate(0deg);
            }
            50% {
                transform: translateY(-20px) rotate(5deg);
            }
        }

        /* Ring Animation */
        .ring {
            position: absolute;
            width: 120px;
            height: 120px;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            opacity: 0;
            z-index: 1;
            pointer-events: none;
        }

        .ring svg {
            width: 100%;
            height: 100%;
            animation: rotateRing 15s linear infinite;
            filter: drop-shadow(var(--glow));
        }

        @keyframes rotateRing {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }

        /* Section Styles */
        section {
            min-height: 100vh;
            padding: 4rem 2rem;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        /* Hero Section */
        .hero {
            text-align: center;
            flex-direction: column;
        }

        .hero-content {
            max-width: 900px;
            margin: 0 auto;
            position: relative;
            z-index: 2;
        }

        .hero h1 {
            font-size: clamp(3rem, 8vw, 6rem);
            margin-bottom: 2rem;
            background: linear-gradient(to right, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            opacity: 0;
            transform: translateY(20px);
            transition: all 1s ease;
            text-shadow: 0 2px 10px rgba(255, 77, 77, 0.3);
        }

        .hero p {
            font-size: clamp(1rem, 3vw, 1.5rem);
            margin: 0 auto 3rem;
            opacity: 0;
            transform: translateY(20px);
            transition: all 1s ease 0.3s;
            max-width: 700px;
        }

        .hero.visible h1,
        .hero.visible p {
            opacity: 1;
            transform: translateY(0);
        }

        /* Scroll Down Indicator */
        .scroll-down {
            position: absolute;
            bottom: 2rem;
            left: 50%;
            transform: translateX(-50%);
            opacity: 0;
            transition: opacity 1s ease 1.5s;
            display: flex;
            flex-direction: column;
            align-items: center;
            z-index: 2;
        }

        .hero.visible .scroll-down {
            opacity: 1;
        }

        .scroll-down span {
            display: block;
            width: 20px;
            height: 20px;
            border-bottom: 2px solid var(--light);
            border-right: 2px solid var(--light);
            transform: rotate(45deg);
            margin: -10px;
            animation: scrollDown 2s infinite;
        }

        .scroll-down span:nth-child(2) {
            animation-delay: -0.2s;
        }

        .scroll-down span:nth-child(3) {
            animation-delay: -0.4s;
        }

        @keyframes scrollDown {
            0% {
                opacity: 0;
                transform: rotate(45deg) translate(-20px, -20px);
            }
            50% {
                opacity: 1;
            }
            100% {
                opacity: 0;
                transform: rotate(45deg) translate(20px, 20px);
            }
        }

        /* Timeline Section */
        .timeline {
            display: flex;
            flex-direction: column;
            align-items: center;
            position: relative;
        }

        .timeline h2 {
            font-size: clamp(2rem, 6vw, 4rem);
            margin-bottom: 4rem;
            text-align: center;
            opacity: 0;
            transform: translateY(20px);
            transition: all 0.8s ease;
        }

        .timeline.visible h2 {
            opacity: 1;
            transform: translateY(0);
        }

        .timeline-container {
            position: relative;
            max-width: 1200px;
            width: 100%;
            padding: 0 2rem;
        }

        .timeline-line {
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 4px;
            height: 100%;
            background: linear-gradient(to bottom, var(--primary), var(--secondary));
            z-index: 1;
            opacity: 0;
            transition: opacity 1s ease;
        }

        .timeline.visible .timeline-line {
            opacity: 1;
        }

        .timeline-item {
            position: relative;
            width: 50%;
            padding: 1.5rem;
            opacity: 0;
            transform: translateX(20px);
            transition: all 0.8s ease;
        }

        .timeline-item:nth-child(even) {
            left: 50%;
            transform: translateX(-20px);
        }

        .timeline-item.visible {
            opacity: 1;
            transform: translateX(0);
        }

        .timeline-content {
            padding: 2rem;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 1rem;
            box-shadow: var(--shadow);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .timeline-content::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, transparent, rgba(255, 77, 77, 0.1), transparent);
            transform: translateX(-100%);
            transition: all 0.6s ease;
        }

        .timeline-content:hover::before {
            transform: translateX(100%);
        }

        .timeline-dot {
            position: absolute;
            top: 50%;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background: var(--primary);
            border: 4px solid white;
            z-index: 2;
            box-shadow: 0 0 0 4px rgba(255, 77, 77, 0.3);
            transition: all 0.3s ease;
        }

        .timeline-item:nth-child(odd) .timeline-dot {
            right: -10px;
        }

        .timeline-item:nth-child(even) .timeline-dot {
            left: -10px;
        }

        .timeline-dot:hover {
            transform: scale(1.2);
            box-shadow: 0 0 0 8px rgba(255, 77, 77, 0.3);
        }

        /* Memory Photos */
        .memory-photo {
            width: 100%;
            height: 200px;
            border-radius: 0.5rem;
            object-fit: cover;
            margin: 1rem 0;
            box-shadow: var(--shadow);
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .memory-photo:hover {
            transform: scale(1.02);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        /* Proposal Section */
        .proposal {
            flex-direction: column;
            text-align: center;
            position: relative;
        }

        .proposal-content {
            max-width: 800px;
            margin: 0 auto;
            position: relative;
            z-index: 2;
        }

        .proposal h2 {
            font-size: clamp(2rem, 6vw, 4rem);
            margin-bottom: 3rem;
            opacity: 0;
            transform: scale(0.8);
            transition: all 0.8s ease;
        }

        .proposal.visible h2 {
            opacity: 1;
            transform: scale(1);
        }

        .buttons {
            display: flex;
            justify-content: center;
            gap: 2rem;
            flex-wrap: wrap;
        }

        .btn {
            padding: 1.5rem 3rem;
            font-size: 1.5rem;
            font-weight: bold;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            z-index: 1;
        }

        .btn-yes {
            background: linear-gradient(45deg, var(--primary), var(--secondary));
            color: white;
            box-shadow: 0 10px 20px rgba(255, 77, 77, 0.3);
        }

        .btn-no {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .btn-yes:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(255, 77, 77, 0.4);
        }

        .btn-yes:active {
            transform: translateY(0);
        }

        .btn-yes::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transform: translateX(-100%);
            transition: all 0.6s ease;
            z-index: -1;
        }

        .btn-yes:hover::after {
            transform: translateX(100%);
        }

        .btn-no:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        /* Confetti Effect */
        .confetti-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 1000;
            display: none;
            overflow: hidden;
        }

        .confetti {
            position: absolute;
            width: 10px;
            height: 10px;
            background: var(--primary);
            opacity: 0;
            z-index: 1000;
        }

        /* Response Message */
        .response {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) scale(0);
            background: rgba(255, 255, 255, 0.95);
            padding: 3rem;
            border-radius: 1rem;
            text-align: center;
            z-index: 1001;
            color: var(--dark);
            opacity: 0;
            transition: all 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.3);
            max-width: 90%;
            width: 100%;
            max-width: 600px;
            backdrop-filter: blur(10px);
        }

        .response.show {
            opacity: 1;
            transform: translate(-50%, -50%) scale(1);
        }

        .response h3 {
            font-size: clamp(2rem, 5vw, 3rem);
            margin-bottom: 1rem;
            color: var(--primary);
        }

        .response p {
            font-size: clamp(1rem, 3vw, 1.5rem);
            margin-bottom: 2rem;
        }

        /* Photo Modal */
        .modal {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.9);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1002;
            opacity: 0;
            pointer-events: none;
            transition: all 0.3s ease;
        }

        .modal.show {
            opacity: 1;
            pointer-events: all;
        }

        .modal-content {
            max-width: 90%;
            max-height: 90%;
            position: relative;
        }

        .modal-img {
            max-width: 100%;
            max-height: 80vh;
            border-radius: 0.5rem;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.5);
        }

        .close-modal {
            position: absolute;
            top: -40px;
            right: 0;
            background: var(--primary);
            color: white;
            border: none;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            font-size: 1rem;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* Floating Music Player */
        .music-player {
            position: fixed;
            bottom: 2rem;
            right: 2rem;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 50px;
            padding: 0.5rem 1rem;
            display: flex;
            align-items: center;
            gap: 1rem;
            z-index: 100;
            box-shadow: var(--shadow);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .music-control {
            background: transparent;
            border: none;
            color: white;
            font-size: 1.5rem;
            cursor: pointer;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

        .music-control:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        .music-title {
            font-size: 0.9rem;
            max-width: 0;
            overflow: hidden;
            white-space: nowrap;
            transition: all 0.5s ease;
        }

        .music-player:hover .music-title {
            max-width: 200px;
            margin-right: 1rem;
        }

        /* Progress Bar */
        .progress-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: transparent;
            z-index: 1000;
        }

        .progress-bar {
            height: 100%;
            background: linear-gradient(to right, var(--primary), var(--secondary));
            width: 0%;
            transition: width 0.1s ease;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .timeline-line {
                left: 20px;
            }

            .timeline-item,
            .timeline-item:nth-child(even) {
                width: 100%;
                left: 0;
                padding-left: 50px;
                padding-right: 0;
            }

            .timeline-item:nth-child(odd) .timeline-dot,
            .timeline-item:nth-child(even) .timeline-dot {
                left: 6px;
            }

            .buttons {
                flex-direction: column;
                align-items: center;
            }

            .btn {
                width: 100%;
                max-width: 300px;
            }

            .music-player {
                bottom: 1rem;
                right: 1rem;
            }
        }

        /* Custom Scrollbar */
        ::-webkit-scrollbar {
            width: 8px;
        }

        ::-webkit-scrollbar-track {
            background: var(--mid);
        }

        ::-webkit-scrollbar-thumb {
            background: var(--primary);
            border-radius: 4px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: var(--secondary);
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Montserrat:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <!-- Progress Bar -->
    <div class="progress-container">
        <div class="progress-bar" id="progressBar"></div>
    </div>

    <!-- Particles Background -->
    <div id="particles-js"></div>

    <!-- Floating Elements -->
    <div class="floating-elements" id="floatingElements">
        <!-- Hearts will be added by JavaScript -->
    </div>

    <!-- Diamond Animation -->
    <div class="diamond" id="diamond">
        <svg viewBox="0 0 100 100">
            <path d="M50 0 L100 50 L50 100 L0 50 Z" fill="#ffffff" stroke="#ff4d4d" stroke-width="2"/>
        </svg>
    </div>

    <!-- Ring Animation -->
    <div class="ring" id="ring">
        <svg viewBox="0 0 100 100">
            <circle cx="50" cy="50" r="45" fill="none" stroke="#ff4d4d" stroke-width="3" stroke-dasharray="5,5"/>
            <circle cx="50" cy="50" r="40" fill="none" stroke="#ff9e9e" stroke-width="2"/>
        </svg>
    </div>

    <!-- Hero Section -->
    <section class="hero" id="hero">
        <div class="hero-content">
            <h1>Will You Marry Me?</h1>
            <p>Every love story is beautiful, but ours is my favorite. This is just the beginning of our forever...</p>
        </div>
        <div class="scroll-down">
            <span></span>
            <span></span>
            <span></span>
        </div>
    </section>

    <!-- Timeline Section -->
    <section class="timeline" id="timeline">
        <h2>Our Journey Together</h2>
        <div class="timeline-container">
            <div class="timeline-line"></div>
            
            <div class="timeline-item">
                <div class="timeline-content">
                    <h3>Our First Meet</h3>
                    <p>June 2020</p>
                    <p>That coffee shop where our eyes met across the room. I knew then you were special.</p>
                    <img src="https://source.unsplash.com/random/800x600/?coffee,date" alt="First Meet" class="memory-photo">
                </div>
                <div class="timeline-dot"></div>
            </div>
            
            <div class="timeline-item">
                <div class="timeline-content">
                    <h3>First Date</h3>
                    <p>August 2020</p>
                    <p>Dinner at that little Italian place. We talked for hours like we'd known each other forever.</p>
                    <img src="https://source.unsplash.com/random/800x600/?restaurant,date" alt="First Date" class="memory-photo">
                </div>
                <div class="timeline-dot"></div>
            </div>
            
            <div class="timeline-item">
                <div class="timeline-content">
                    <h3>Our First Trip</h3>
                    <p>December 2020</p>
                    <p>The mountains where we got snowed in. Best "stranded" experience of my life.</p>
                    <img src="https://source.unsplash.com/random/800x600/?mountain,snow" alt="First Trip" class="memory-photo">
                </div>
                <div class="timeline-dot"></div>
            </div>
        </div>
    </section>

    <!-- Proposal Section -->
    <section class="proposal" id="proposal">
        <div class="proposal-content">
            <h2>Will You Make Me The Happiest Person Alive?</h2>
            <div class="buttons">
                <button class="btn btn-yes" id="btnYes">Yes, Absolutely!</button>
                <button class="btn btn-no" id="btnNo">I Need To Think</button>
            </div>
        </div>
    </section>

    <!-- Confetti Effect -->
    <div class="confetti-container" id="confettiContainer"></div>

    <!-- Response Message -->
    <div class="response" id="response">
        <h3>You've Made Me So Happy!</h3>
        <p>I can't wait to spend the rest of my life with you.</p>
        <p>This is just the beginning of our beautiful journey together.</p>
        <button class="btn btn-yes" id="btnCloseResponse">Close</button>
    </div>

    <!-- Photo Modal -->
    <div class="modal" id="photoModal">
        <div class="modal-content">
            <button class="close-modal" id="closeModal">&times;</button>
            <img src="" alt="Memory Photo" class="modal-img" id="modalImg">
        </div>
    </div>

    <!-- Floating Music Player -->
    <div class="music-player" id="musicPlayer">
        <button class="music-control" id="playPauseBtn">
            <i class="fas fa-play" id="playIcon"></i>
        </button>
        <span class="music-title">Our Song - Romantic Music</span>
    </div>

    <script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // DOM Elements
            const progressBar = document.getElementById('progressBar');
            const floatingElements = document.getElementById('floatingElements');
            const diamond = document.getElementById('diamond');
            const ring = document.getElementById('ring');
            const heroSection = document.getElementById('hero');
            const timelineSection = document.getElementById('timeline');
            const proposalSection = document.getElementById('proposal');
            const btnYes = document.getElementById('btnYes');
            const btnNo = document.getElementById('btnNo');
            const response = document.getElementById('response');
            const btnCloseResponse = document.getElementById('btnCloseResponse');
            const confettiContainer = document.getElementById('confettiContainer');
            const photoModal = document.getElementById('photoModal');
            const modalImg = document.getElementById('modalImg');
            const closeModal = document.getElementById('closeModal');
            const memoryPhotos = document.querySelectorAll('.memory-photo');
            const musicPlayer = document.getElementById('musicPlayer');
            const playPauseBtn = document.getElementById('playPauseBtn');
            const playIcon = document.getElementById('playIcon');

            // Audio Element
            const audio = new Audio();
            audio.src = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"; // Replace with your romantic music
            audio.volume = 0.3;

            // Initialize particles.js
            particlesJS('particles-js', {
                "particles": {
                    "number": {
                        "value": 100,
                        "density": {
                            "enable": true,
                            "value_area": 800
                        }
                    },
                    "color": {
                        "value": "#ff4d4d"
                    },
                    "shape": {
                        "type": "circle",
                        "stroke": {
                            "width": 0,
                            "color": "#000000"
                        },
                        "polygon": {
                            "nb_sides": 5
                        }
                    },
                    "opacity": {
                        "value": 0.5,
                        "random": true,
                        "anim": {
                            "enable": true,
                            "speed": 1,
                            "opacity_min": 0.1,
                            "sync": false
                        }
                    },
                    "size": {
                        "value": 3,
                        "random": true,
                        "anim": {
                            "enable": true,
                            "speed": 2,
                            "size_min": 0.1,
                            "sync": false
                        }
                    },
                    "line_linked": {
                        "enable": true,
                        "distance": 150,
                        "color": "#ff9e9e",
                        "opacity": 0.4,
                        "width": 1
                    },
                    "move": {
                        "enable": true,
                        "speed": 2,
                        "direction": "none",
                        "random": true,
                        "straight": false,
                        "out_mode": "out",
                        "bounce": false,
                        "attract": {
                            "enable": false,
                            "rotateX": 600,
                            "rotateY": 1200
                        }
                    }
                },
                "interactivity": {
                    "detect_on": "canvas",
                    "events": {
                        "onhover": {
                            "enable": true,
                            "mode": "grab"
                        },
                        "onclick": {
                            "enable": true,
                            "mode": "push"
                        },
                        "resize": true
                    },
                    "modes": {
                        "grab": {
                            "distance": 140,
                            "line_linked": {
                                "opacity": 1
                            }
                        },
                        "bubble": {
                            "distance": 400,
                            "size": 40,
                            "duration": 2,
                            "opacity": 8,
                            "speed": 3
                        },
                        "repulse": {
                            "distance": 200,
                            "duration": 0.4
                        },
                        "push": {
                            "particles_nb": 4
                        },
                        "remove": {
                            "particles_nb": 2
                        }
                    }
                },
                "retina_detect": true
            });

            // Create floating elements
            function createFloatingElements() {
                const elements = ['❤️', '💍', '💕', '💘', '💖', '✨', '🌟'];
                
                for (let i = 0; i < 30; i++) {
                    const element = document.createElement('div');
                    element.className = 'floating-heart';
                    element.textContent = elements[Math.floor(Math.random() * elements.length)];
                    element.style.left = Math.random() * 100 + 'vw';
                    element.style.top = Math.random() * 100 + 'vh';
                    element.style.animationDuration = 5 + Math.random() * 15 + 's';
                    element.style.animationDelay = Math.random() * 5 + 's';
                    element.style.fontSize = (1 + Math.random() * 2) + 'rem';
                    floatingElements.appendChild(element);
                }
            }

            // Scroll progress bar
            function updateProgressBar() {
                const scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
                const scrollHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight;
                const scrollProgress = (scrollTop / scrollHeight) * 100;
                progressBar.style.width = scrollProgress + '%';
            }

            // Intersection Observer for animations
            const observerOptions = {
                threshold: 0.1
            };

            const heroObserver = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('visible');
                        diamond.style.opacity = '0.3';
                        ring.style.opacity = '0';
                    }
                });
            }, observerOptions);

            const timelineObserver = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('visible');
                        const items = document.querySelectorAll('.timeline-item');
                        items.forEach((item, index) => {
                            setTimeout(() => {
                                item.classList.add('visible');
                            }, index * 300);
                        });
                        diamond.style.opacity = '0.6';
                        ring.style.opacity = '0.3';
                    }
                });
            }, observerOptions);

            const proposalObserver = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('visible');
                        diamond.style.opacity = '1';
                        ring.style.opacity = '0.6';
                    }
                });
            }, observerOptions);

            // Initialize observers
            heroObserver.observe(heroSection);
            timelineObserver.observe(timelineSection);
            proposalObserver.observe(proposalSection);

            // Button interactions
            btnYes.addEventListener('click', function() {
                // Show confetti
                confettiContainer.style.display = 'block';
                createConfetti();
                
                // Show response message
                setTimeout(() => {
                    response.classList.add('show');
                }, 1000);
                
                // Play sound
                playCelebrationSound();
                
                // Animate diamond and ring
                animateCelebration();
            });

            btnNo.addEventListener('mouseover', function() {
                // Make the "No" button move away
                const moveX = Math.random() > 0.5 ? 100 : -100;
                const moveY = Math.random() > 0.5 ? 50 : -50;
                
                btnNo.style.transform = `translate(${moveX}px, ${moveY}px)`;
                btnNo.style.transition = 'transform 0.3s ease';
            });

            btnNo.addEventListener('mouseout', function() {
                btnNo.style.transform = 'translate(0, 0)';
            });

            btnCloseResponse.addEventListener('click', function() {
                response.classList.remove('show');
            });

            // Photo modal
            memoryPhotos.forEach(photo => {
                photo.addEventListener('click', function() {
                    modalImg.src = this.src;
                    photoModal.classList.add('show');
                });
            });

            closeModal.addEventListener('click', function() {
                photoModal.classList.remove('show');
            });

            // Music player
            let isPlaying = false;

            playPauseBtn.addEventListener('click', function() {
                if (isPlaying) {
                    audio.pause();
                    playIcon.classList.remove('fa-pause');
                    playIcon.classList.add('fa-play');
                } else {
                    audio.play();
                    playIcon.classList.remove('fa-play');
                    playIcon.classList.add('fa-pause');
                }
                isPlaying = !isPlaying;
            });

            // Diamond follow cursor
            document.addEventListener('mousemove', function(e) {
                diamond.style.left = e.clientX + 'px';
                diamond.style.top = e.clientY + 'px';
                
                // Ring follows with delay
                setTimeout(() => {
                    ring.style.left = e.clientX + 'px';
                    ring.style.top = e.clientY + 'px';
                }, 100);
            });

            // Confetti function
            function createConfetti() {
                const colors = ['#ff4d4d', '#ff9e9e', '#ffffff', '#ffd700', '#ffa500'];
                const shapes = ['circle', 'square', 'triangle'];
                
                for (let i = 0; i < 200; i++) {
                    const confetti = document.createElement('div');
                    confetti.className = 'confetti';
                    confetti.style.left = Math.random() * 100 + 'vw';
                    confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
                    
                    // Random shape
                    const shape = shapes[Math.floor(Math.random() * shapes.length)];
                    if (shape === 'circle') {
                        confetti.style.borderRadius = '50%';
                    } else if (shape === 'triangle') {
                        confetti.style.clipPath = 'polygon(50% 0%, 0% 100%, 100% 100%)';
                    }
                    
                    // Random size
                    const size = Math.random() * 10 + 5;
                    confetti.style.width = size + 'px';
                    confetti.style.height = size + 'px';
                    
                    // Random rotation
                    confetti.style.transform = `rotate(${Math.random() * 360}deg)`;
                    
                    // Animation
                    const animationDuration = Math.random() * 3 + 2;
                    confetti.style.animation = `fall ${animationDuration}s linear forwards`;
                    
                    // Add to container
                    confettiContainer.appendChild(confetti);
                    
                    // Remove confetti after animation
                    setTimeout(() => {
                        confetti.remove();
                    }, animationDuration * 1000);
                }
                
                // Keyframes for falling animation
                const style = document.createElement('style');
                style.innerHTML = `
                    @keyframes fall {
                        to {
                            top: 100vh;
                            opacity: 0;
                            transform: rotate(360deg) translateX(${Math.random() > 0.5 ? Math.random() * 100 : Math.random() * -100}px);
                        }
                    }
                `;
                document.head.appendChild(style);
            }

            // Celebration sound
            function playCelebrationSound() {
                const celebrationSound = new Audio();
                celebrationSound.src = "https://assets.mixkit.co/sfx/preview/mixkit-achievement-bell-600.mp3";
                celebrationSound.volume = 0.3;
                celebrationSound.play().catch(e => console.log("Audio play failed:", e));
            }

            // Celebration animation
            function animateCelebration() {
                // Pulse diamond
                diamond.style.animation = 'pulse 0.5s ease infinite alternate';
                
                // Add keyframes
                const style = document.createElement('style');
                style.innerHTML = `
                    @keyframes pulse {
                        to {
                            transform: translate(-50%, -50%) scale(1.2);
                            filter: drop-shadow(0 0 30px rgba(255, 77, 77, 0.9));
                        }
                    }
                `;
                document.head.appendChild(style);
                
                // Faster ring rotation
                ring.style.animation = 'rotateRing 3s linear infinite';
            }

            // Create floating elements on load
            createFloatingElements();

            // Update progress bar on scroll
            window.addEventListener('scroll', updateProgressBar);

            // Initialize progress bar
            updateProgressBar();
        });
    </script>
</body>
</html>
