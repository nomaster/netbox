FROM python
EXPOSE 80
VOLUME /opt/netbox/netbox/media
ENTRYPOINT ["/opt/netbox/entrypoint.sh"]
WORKDIR /opt/netbox
CMD ["gunicorn", "-c", "/opt/netbox/gunicorn_config.py", "netbox.wsgi"]
COPY gunicorn_config.py .
COPY entrypoint.sh .
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY netbox .
