from flask import Flask, request, jsonify, send_file
from pytube import YouTube
from pathlib import Path
from sys import argv
import os

ytDownloader = Flask(__name__)

@ytDownloader.route ('/download', methods=['POST'])
def download():
    try:
        data = request.get_json()
        yt_get = data.get('Youtube URL Address')
        if not yt_get:
            return jsonify({"error": "YouTube URL Address is required"}), 400

        downloads_path = Path.home() / "Downloads"
        downloads_path.mkdir(exist_ok=True)

        yt = YouTube(yt_get)

        yd = yt.streams.get_highest_resolution()

        downloaded_file = yd.download(output_path=str(downloads_path))

        return send_file(downloaded_file, as_attachment=True, download_name=os.path.basename(downloaded_file))

    except Exception as e:
        return jsonify({"error": str(e)}), 500
