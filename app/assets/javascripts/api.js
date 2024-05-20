const ved = document.querySelector('section');

if (!ved) {
    console.error("Section element not found.");
} else {
    const watchedVideos = localStorage.getItem('watchedVideos') ? JSON.parse(localStorage.getItem('watchedVideos')) : {};
    let totalVideos = 0;
    let watchedCount = 0;

    fetch("https://youtube.googleapis.com/youtube/v3/playlistItems?part=contentDetails%20%2Csnippet&maxResults=3&playlistId=PLKSSXmUUSqev7bD5K_nOO2d4S8iv92zmp&key=AIzaSyCoQ5_IY3cZs8bu3_pwXPw6xnfatyZtfAU")
        .then((res) => res.json())
        .then(data => {
            
            if (data.items && data.items.length > 0) {
                totalVideos = data.items.length; // Total number of videos fetched

                data.items.forEach((videoItem, index) => {
                    const video = videoItem.snippet;
                    const videoId = video.resourceId.videoId;
                    const thumbnailUrl = video.thumbnails.maxres.url;
                    const isWatched = watchedVideos[videoId] || false; // Check if video is marked as watched

                    if (isWatched) {
                        watchedCount++; // Increment watched count if video is watched
                    }

                    // Display the status of the video
                    const statusElement = document.createElement('div');
                    statusElement.style.fontSize = "20px";
                    statusElement.textContent = isWatched ? 'Watched' : 'Not Watched';
                    statusElement.style.fontWeight = "bold";
                    statusElement.style.color = "Black"; // Set font weight to bold
                    ved.appendChild(statusElement);


                    // Create player container
                    const playerDiv = document.createElement('div');
                    playerDiv.id = `player_${videoId}`;
                    ved.appendChild(playerDiv);

                    // Initialize YouTube player
                    const player = new YT.Player(`player_${videoId}`, {
                        height: '360',
                        width: '640',
                        videoId: videoId,
                        playerVars: {
                            controls: 1, // Hide player controls
                            disablekb: 1, // Disable keyboard controls
                            modestbranding: 1, // Hide YouTube logo
                            rel: 0, // Do not show related videos at the end
                            loop: 1, // Loop the video
                            start: 0 // Start the video from the beginning
                        },
                        events: {
                            'onReady': onPlayerReady,
                            'onStateChange': onPlayerStateChange
                        }
                    });

                    // Function to handle when the player is ready
                    function onPlayerReady(event) {
                        // Video does not start automatically
                    }

                    // Function to track when the video playback state changes
                    function onPlayerStateChange(event) {
                        if (event.data === YT.PlayerState.ENDED) {
                            if (!isWatched) {
                                watchedVideos[videoId] = true;
                                localStorage.setItem('watchedVideos', JSON.stringify(watchedVideos));
                                statusElement.textContent = 'Watched';
                                watchedCount++; // Increment watched count
                                checkWatchedVideosCount(); // Check watched videos count
                            }
                        }
                    }

                    // Function to check watched videos count and display/hide assessment button
                    function checkWatchedVideosCount() {
                        const assessmentBtn = document.querySelector('.assesmentBtn'); // Select assessment button

                        console.log(`Watched Count: ${watchedCount}, Total Videos: ${totalVideos}`); // Debugging log

                        if (watchedCount === totalVideos) {
                            console.log('Showing assessment button'); // Debugging log
                            // Show assessment button
                            assessmentBtn.style.display = 'block';
                        } else {
                            console.log('Hiding assessment button'); // Debugging log
                            // Hide assessment button
                            assessmentBtn.style.display = 'none';
                        }
                    }
                });
            } else {
                console.error("No videos found in the playlist.");
            }
        })
        .catch(error => console.error("Error fetching data:", error));
}

// Initially hide the assessment button
document.addEventListener('DOMContentLoaded', () => {
    const assessmentBtn = document.querySelector('.assesmentBtn');
    if (assessmentBtn) {
        assessmentBtn.style.display = 'none';
    }
});

// Clear localStorage on page refresh
window.addEventListener('beforeunload', () => {
    localStorage.removeItem('watchedVideos');
});
