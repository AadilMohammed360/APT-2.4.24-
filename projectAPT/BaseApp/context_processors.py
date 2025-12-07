from .models import SiteContent

def site_content(request):
    """Make site content available in all templates"""
    return {
        'site_content': SiteContent.get_content()
    }
